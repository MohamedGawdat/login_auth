import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../main.dart';
import '../../../utilities/navigation_util.dart';
import '../containers/white_container.dart';

import 'package:provider/provider.dart';
import '../../../../../style/app_text_style.dart';

/*
                    onSearch!(value);

 */
Future<dynamic> appCustomDropDownOnSelectWithRadioButtons(
  BuildContext context, {
  required Function onConfirm,
  Function? onSearch,
  Function? onChangeMainList,
  Function? onChangeSuppList,
  List<String>? list,
  Widget? subList,
  // required ChangeNotifier value,
  String? title,
  String? selectedSubFilter,
  bool showCancelButton = true,
}) {
  return showCustomModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => ChangeNotifierProvider(
      create: (context) => DropDownRadio(),
      child: Consumer<DropDownRadio>(
        builder: (context, provider, child) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppWhiteContainer(
                // height: 0.2.sh,
                radius: 8,
                child: Column(
                  children: [
                    Text(
                      title ?? '',
                      style: AppTextStyle.normalTextBold,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => RadioListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(list![index]),
                                ],
                              ),
                              value: list[index],
                              groupValue: provider.value,
                              onChanged: (String? value) {
                                provider.changeValue(value ?? '');
                                // setState(() {
                                //   selected = value;
                                // });
                              },
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemCount: list!.length),
                  ],
                ),
              ),
              SizedBox(
                width: 1.sw,
                height: 0.008.sh,
              ),
              if (subList != null)
                AppWhiteContainer(
                  // height: 0.2.sh,
                  radius: 8,
                  child: subList,
                ),
              // if (showCancelButton)

              Column(
                children: [
                  SizedBox(
                    width: 1.sw,
                    height: 0.02.sh,
                  ),
                  AppWhiteContainer(
                      height: 0.07.sh,
                      radius: 8,
                      child: InkWell(
                        onTap: () {
                          NavigateUtil.pop(context);
                          onConfirm(provider.value);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'تأكيد',
                              style: AppTextStyle.mainTextStyle,
                            ),
                          ],
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 0.015.sh,
                width: 1.sw,
              ),
            ],
          ),
        ),
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

class DropDownRadio with ChangeNotifier {
  String value = '';
  changeValue(String newValue) {
    value = newValue;
    notifyListeners();
  }
}

Future<dynamic> appCustomDropDownOnSelect({
  required Function onConfirm,
  List<String>? list,
  // required ChangeNotifier value,
  String? title,
  bool showCancelButton = true,
}) {
  return showCustomModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: navigatorKey.currentState!.context,
    builder: (context) => SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              // Text(
              //   title ?? '',
              //   style: AppTextStyle.normalTextBold,
              // ),
              // SizedBox(
              //   width: 1.sw,
              //   height: 0.008.sh,
              // ),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => AppWhiteContainer(
                        radius: 8,
                        height: 70,
                        child: InkWell(
                            onTap: () {
                              NavigateUtil.pop(context);
                              onConfirm(list![index]);
                            },
                            child: Center(
                              child: Text(
                                list![index],
                                style: AppTextStyle.normalTextBold,
                              ),
                            )),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 15,
                        width: 1.sw,
                      ),
                  itemCount: list!.length),
            ],
          ),

          // if (showCancelButton)

          SizedBox(
            height: 0.02.sh,
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
