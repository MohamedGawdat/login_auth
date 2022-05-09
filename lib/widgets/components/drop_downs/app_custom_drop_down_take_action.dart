import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../style/app_colors.dart';
import '../../../style/app_text_style.dart';
import '../../../utilities/navigation_util.dart';
import '../containers/white_container.dart';

class AppCustomDropDownWithActions extends StatelessWidget {
  // final Widget child;
  final List<Widget> actions;
  const AppCustomDropDownWithActions(
      {Key? key,
      // required this.child    ,
      required this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return actions.isNotEmpty
        ? IconButton(
            onPressed: () {
              showCustomModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  // topRadius: Radius.circular(18),
                  // builder: [],
                  builder: (context) => ListView(
                        // height: 0.3.sh,
                        shrinkWrap: true,
                        children: [
                          AppWhiteContainer(
                            // height: 0.2.sh,
                            radius: 8,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: actions.map((e) => e).toList(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 0.015.sh,
                            width: 1.sw,
                          ),
                          InkWell(
                            onTap: () {
                              NavigateUtil.pop(context);
                            },
                            child: AppWhiteContainer(
                                height: 0.07.sh,
                                radius: 8,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'إلغاء',
                                      style: AppTextStyle.titlesHeader,
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 0.01.sh,
                            width: 1.sw,
                          ),
                        ],
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
                      ));
              // setState(() {
              //   expansionTile = GlobalKey();
              // });
              // expansionTile.currentState.();
            },
            icon: const Icon(
              Icons.more_horiz,
              color: AppColors.greyColor,
            ),
          )
        : const SizedBox();
  }
}

class ActionOnCustomDropDown {
  final Function action;
  final String iconName;
  final String title;
  ActionOnCustomDropDown({
    required this.action,
    required this.iconName,
    required this.title,
  });
}
