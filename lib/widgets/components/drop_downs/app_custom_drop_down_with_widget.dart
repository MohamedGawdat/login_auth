import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AppCustomDropDownWithWidgetChild extends StatefulWidget {
  // final String title;
  final bool showArrow;
  final Widget child;
  final ListView dropDownWidget;

  const AppCustomDropDownWithWidgetChild(
      {Key? key,
      // required this.title,
      // required this.list,
      required this.child,
      required this.dropDownWidget,
      this.showArrow = true})
      : super(key: key);

  @override
  State<AppCustomDropDownWithWidgetChild> createState() =>
      _AppCustomDropDownWithWidgetChildState();
}

class _AppCustomDropDownWithWidgetChildState
    extends State<AppCustomDropDownWithWidgetChild> {
  bool isSheetOpen = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.dropDownWidget.semanticChildCount! > 0) {
          setState(() {
            isSheetOpen = true;
          });
          buildShowMaterialModalBottomSheet(context, widget.dropDownWidget);
        } else {
          // ToastUtil.showShortToast(message: 'لا يوجد')
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.child,
            if (widget.showArrow)
              Icon(
                isSheetOpen
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
              ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> buildShowMaterialModalBottomSheet(
      BuildContext context, ListView dropDownWidget) {
    return showCupertinoModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      topRadius: const Radius.circular(18),
      builder: (context) => Container(
        // height: 0.5.sh,
        decoration: const BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.only(
          //   topRight: Radius.circular(18),
          //   topLeft: Radius.circular(18),
          // ),
        ),
        child: dropDownWidget,
      ),
    ).whenComplete(() {
      toggleSheet();
    });
  }

  toggleSheet() {
    setState(() {
      isSheetOpen = false;
    });
  }
}
