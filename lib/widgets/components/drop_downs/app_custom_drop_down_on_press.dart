import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../style/app_text_style.dart';
import '../../../utilities/navigation_util.dart';
import '../containers/white_container.dart';

/*
                    onSearch!(value);

 */
Future<dynamic> appCustomDropDownFiltration(BuildContext context,
    {Function? onSearch,
    Function? onChangeMainList,
    Function? onChangeSuppList,
    List? list,
    List? subList,
    // required ChangeNotifier value,
    required String selectedFilter,
    String? selectedSubFilter,
    bool showCancelButton = true}) {
  return showCustomModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  NavigateUtil.pop(context);
                },
                icon: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.close,
                    // style: AppTextStyle.titlesHeader,
                  ),
                ),
              ),
            ],
          ),
          AppWhiteContainer(
            // height: 0.2.sh,
            radius: 8,
            child: ListView.separated(
              physics: const ClampingScrollPhysics(),
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 2),
              separatorBuilder: (context, index) => const Divider(
                thickness: 2,
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) => RadioListTile(
                contentPadding: const EdgeInsets.all(0),

                value: list![index].toString(),
                groupValue: selectedFilter,
                // selected: ,
                onChanged: (value) {
                  if (onChangeMainList != null) {
                    onChangeMainList(list[index]);
                  }
                  // onSearch!(list![index]);
                  NavigateUtil.pop(context);
                  // onChangeMainList!(value);
                  // NavigateUtil.pop(context);
                  // setState(() {
                  //   val = value;
                  // });
                },
                // activeColor: Colors.yellow,
                title: Text(
                  list[index] is String
                      ? list[index]
                      : list[index].selectedTitle,
                  style: AppTextStyle.darkBlueSemiBold,
                ),
              ),
              itemCount: list!.length,
            ),
          ),
          if (subList != null)
            Column(
              children: [
                SizedBox(
                  width: 1.sw,
                  // height: 0.2.sh,

                  height: 0.015.sh,
                ),
                AppWhiteContainer(
                  // height: 0.2.sh,
                  radius: 8,
                  child: ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 2),
                    separatorBuilder: (context, index) => const Divider(
                      thickness: 2,
                    ),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => RadioListTile(
                      contentPadding: const EdgeInsets.all(0),

                      value: subList[index].toString(),
                      groupValue: selectedSubFilter,
                      // selected: ,
                      onChanged: (value) {
                        // onSearch!(value);
                        if (onChangeSuppList != null) {
                          onChangeSuppList(subList[index]);
                          // onSearch!();
                        }
                        // onSearch!(list![index]);
                        NavigateUtil.pop(context); // setState(() {
                        //   val = value;
                        // });
                      },
                      // activeColor: Colors.yellow,
                      title: Text(
                        subList[index] is String
                            ? subList[index]
                            : subList[index].selectedTitle,
                        style: AppTextStyle.darkBlueSemiBold,
                      ),
                    ),
                    itemCount: subList.length,
                  ),
                ),
              ],
            ),
          if (showCancelButton)
            Column(
              children: [
                // SizedBox(
                //   width: 1.sw,
                //   height: 0.015.sh,
                // ),
                // InkWell(
                //   onTap: () {
                //     // value.inTest();
                //   },
                //   child: AppWhiteContainer(
                //       height: 0.07.sh,
                //       radius: 8,
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Text(
                //             'بحث'
                //             // + value.test.toString()
                //             ,
                //             style: AppTextStyle.titlesHeader,
                //           ),
                //         ],
                //       )),
                // ),
                SizedBox(
                  width: 1.sw,
                  height: 0.001.sh,
                ),
                // AppWhiteContainer(
                //     height: 0.07.sh,
                //     radius: 8,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text(
                //           'إلغاء',
                //           style: AppTextStyle.titlesHeader,
                //         ),
                //       ],
                //     )),
              ],
            ),
          SizedBox(
            height: 0.015.sh,
            width: 1.sw,
          ),
        ],
      ),
    ),
    containerWidget: (_, animation, child) => SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.025.sw),
        child: Material(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(12),
          child: child,
        ),
      ),
    ),
  );
}
