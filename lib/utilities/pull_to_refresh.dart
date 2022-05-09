import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

import '../style/app_colors.dart';
import 'app_api_pagination.dart';
import 'app_loader.dart';

class AppPullToRefresh extends StatefulWidget {
  final Widget child;
  final Function? onRefresh;
  final Function? onLoad;
  final Function? initState;
  final Function? fetchDataManager;
  final bool showShimmer;
  // final int pageNumber;
  final int? maxDataPages;
  final dynamic dataToCheck;
  const AppPullToRefresh({
    Key? key,
    required this.child,
    this.onRefresh,
    this.onLoad,
    this.initState,
    this.fetchDataManager,
    // this.pageNumber = 1,
    this.maxDataPages,
    this.dataToCheck,
    this.showShimmer = true,
  }) : super(key: key);

  @override
  _AppPullToRefreshState createState() => _AppPullToRefreshState();
}

class _AppPullToRefreshState extends State<AppPullToRefresh> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // print('_onRefresh');
    if (widget.onRefresh != null) {
      await widget.onRefresh!();
    }
    await resetData();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // print('_onLoading');

    if (widget.onLoad != null) {
      if (await widget.onLoad!()) {}
    }
    if (pageNumber == 0 || pageNumber == 1) pageNumber = 2;
    await fetchDataManager();

    _refreshController.loadComplete();
  }

  int pageNumber = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    // pageNumber = widget.pageNumber;
    if (widget.initState != null) {
      widget.initState!();
    }
    if (widget.dataToCheck == null) fetchDataManager();
  }

  Future resetData() async {
    pageNumber = 1;
    await fetchDataManager();
  }

  fetchDataManager() async {
    if (widget.fetchDataManager != null) {
      if (AppApiPagination.hasMorePages(
          page: pageNumber, total: widget.maxDataPages ?? 2)) {
        if (await widget.fetchDataManager!(pageNumber)) {
          ++pageNumber;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      // physics: NeverScrollableScrollPhysics(),
      enablePullDown: true,
      enablePullUp: true,

      header: const WaterDropMaterialHeader(
        color: AppColors.greenColor,
        backgroundColor: AppColors.mainBackGroundColor,
      ),
      footer: CustomFooter(
        builder: (
          BuildContext context,
          LoadStatus? mode,
        ) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = const SizedBox();
          } else if (mode == LoadStatus.loading) {
            body = const CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = const Text("Load Failed!Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            body = const Text("release to load more");
          } else {
            body = const Text("No more Data");
          }
          return SizedBox(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: widget.dataToCheck == null
          ? (widget.showShimmer
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                      child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    enabled: true,
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          AppLoader.appLoaderShimmerWidget(),
                      itemCount: 20,
                    ),
                  )),
                )
              : AppLoader.appLoaderWidget())
          : widget.child,
    );
  }
}
