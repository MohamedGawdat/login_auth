import 'package:flutter/material.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/app_colors.dart';
import '../../../style/app_text_style.dart';
import '../../../utilities/navigation_util.dart';

import '../containers/app_input_decorated.dart';
import '../dividers.dart';
import '../reversr_directionality.dart';

class AppCustomDropDownWithTitle extends StatefulWidget {
  final String selectedTitle;
  final int? selectedMaxLines;
  final String title;
  final Function? callBack;
  final bool reverseDirection;
  final List? list;
  final Widget? subList;
  const AppCustomDropDownWithTitle(
      {Key? key,
      required this.selectedTitle,
      this.selectedMaxLines,
      required this.title,
      this.reverseDirection = false,
      required this.list,
      required this.callBack,
      this.subList})
      : super(key: key);

  @override
  State<AppCustomDropDownWithTitle> createState() =>
      _AppCustomDropDownWithTitleState();
}

class _AppCustomDropDownWithTitleState
    extends State<AppCustomDropDownWithTitle> {
  bool isSheetOpen = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSheetOpen = true;
        });
        buildShowMaterialModalBottomSheet(context);
      },
      child: AppInputDecorator(
        label: Text(widget.title),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              APPReverseDirectionality(
                reverse: widget.reverseDirection,
                child: Flexible(
                  child: Text(
                    widget.selectedTitle,
                    style: AppTextStyle.mainTextStyle,
                    maxLines: widget.selectedMaxLines,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                isSheetOpen
                    ? Icons.arrow_circle_up_outlined
                    : Icons.arrow_drop_down_circle_outlined,
                color: AppColors.greyColor,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildShowMaterialModalBottomSheet(BuildContext context) {
    return showCupertinoModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      topRadius: const Radius.circular(18),
      builder: (context) => SingleChildScrollView(
        // controller: ModalScrollController.of(context),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 0.5.sh),
          child: Container(
            // height: 0.5.sh,
            decoration: const BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.only(
              //   topRight: Radius.circular(18),
              //   topLeft: Radius.circular(18),
              // ),
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                ListView.separated(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  separatorBuilder: (context, index) =>
                      const AppHorizontalDivider(
                    thickness: 2,
                    // width: 0.95.sw,
                  ),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => APPReverseDirectionality(
                    reverse: widget.reverseDirection,
                    child: InkWell(
                      onTap: () async {
                        widget.callBack!(widget.list![index]);
                        toggleSheet();

                        NavigateUtil.pop(context);
                        FocusManager.instance.primaryFocus!.unfocus();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.list![index] is String
                                  ? widget.list![index]
                                  : widget.list![index].title,
                              style: AppTextStyle.mainTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  itemCount: widget.list!.length,
                ),
                if (widget.subList != null) widget.subList!
              ],
            ),
          ),
        ),
      ),
    ).whenComplete(() {
      FocusManager.instance.primaryFocus!.unfocus();

      toggleSheet();
    });
  }

  toggleSheet() {
    setState(() {
      isSheetOpen = false;
    });
  }
}
