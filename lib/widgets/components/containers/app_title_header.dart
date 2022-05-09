import 'package:flutter/material.dart';
import '../../../style/app_colors.dart';
import '../../../style/app_text_style.dart';
import '../drop_downs/app_custom_drop_down_on_press.dart';

class FilterIconOptions {
  final List<String>? filterList;
  final List<String>? filterSubList;
  final String? selectedFilter;
  final String? selectedSuppFilter;
  final Function? onSearch;
  final Function? onChangeMainList;
  final Function? onChangeSuppList;
  final Function? customFilterAction;
  final String? icon;
  final Widget? customIcon;
  final bool showFilter;

  const FilterIconOptions({
    this.filterList,
    this.filterSubList,
    this.selectedFilter,
    this.selectedSuppFilter,
    this.onSearch,
    this.onChangeMainList,
    this.onChangeSuppList,
    this.customFilterAction,
    this.icon = 'assets/icons/filter_setting.png',
    // size: 30,
    this.customIcon,
    this.showFilter = true,
  });
}

class AppTitleHeader extends StatelessWidget {
  final String title;
  final String? subTitle;
  final List<FilterIconOptions> filters;

  // final  ChangeNotifier value;
  const AppTitleHeader({
    Key? key,
    required this.title,
    this.subTitle,
    this.filters = const [],

    // required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: AppTextStyle.mainTextMainColor2,
              ),
              if (subTitle != null)
                Row(
                  children: [
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      subTitle!,
                      style: AppTextStyle.smallGreyAppText,
                    ),
                  ],
                ),
            ],
          ),
          Row(
              children: filters
                  .map(
                    (e) => IconButton(
                      onPressed: () {
                        if (e.customFilterAction != null) {
                          e.customFilterAction!();
                        } else {
                          appCustomDropDownFiltration(context,
                              list: e.filterList,
                              // value: value,
                              subList: e.filterSubList,
                              selectedFilter: e.selectedFilter!,
                              selectedSubFilter: e.selectedSuppFilter,
                              onChangeMainList: (selected) {
                            if (e.onChangeMainList != null) {
                              e.onChangeMainList!(selected);
                            }
                            if (e.onSearch != null) e.onSearch!();
                          }, onChangeSuppList: (selected) {
                            if (e.onChangeSuppList != null) {
                              e.onChangeSuppList!(selected);
                            }
                            if (e.onSearch != null) e.onSearch!();
                          }, onSearch: () {
                            if (e.onSearch != null) e.onSearch!();
                          });
                        }
                      },
                      icon: e.icon != null
                          ? Image.asset(
                              e.icon!,
                              color: AppColors.greyColor,
                            )
                          : e.customIcon ?? const SizedBox(),
                    ),
                  )
                  .toList()
              // [
              // IconButton(
              //   onPressed: () {
              //     appCustomDropDownFiltration(context,
              //         list: mainFilter.filterList,
              //         // value: value,
              //         subList: mainFilter.filterSubList,
              //         selectedFilter: mainFilter.selectedFilter!,
              //         selectedSubFilter: mainFilter.selectedSuppFilter,
              //         onChangeMainList: (selected) {
              //       if (mainFilter.onChangeMainList != null) {
              //         mainFilter.onChangeMainList!(selected);
              //       }
              //       if (mainFilter.onSearch != null) mainFilter.onSearch!();
              //     }, onChangeSuppList: (selected) {
              //       if (mainFilter.onChangeSuppList != null) {
              //         mainFilter.onChangeSuppList!(selected);
              //       }
              //       if (mainFilter.onSearch != null) mainFilter.onSearch!();
              //     }, onSearch: () {
              //       if (mainFilter.onSearch != null) mainFilter.onSearch!();
              //     });
              //   },
              //   icon: Image.asset(
              //     'assets/icons/sort_up_down.png',
              //     color: AppColors.greyColor,
              //     // width: 24,
              //   ),
              // ),
              // if (mainFilter != null &&
              //     (mainFilter!.filterList != null ||
              //         mainFilter!.customFilterAction != null))
              // SizedBox(
              //   width: 5,
              // ),

              // AppVerticalDivider(),
              // IconButton(
              //     onPressed: () {},
              //     icon: Image.asset(
              //       'assets/icons/search.png',
              //       // size: 30,
              //     )),
              // ],
              ),
        ],
      ),
    );
  }
}
