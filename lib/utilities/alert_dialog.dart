import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:numberpicker/numberpicker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../main.dart';
import '../style/app_colors.dart';
import '../style/app_text_style.dart';
import 'navigation_util.dart';

class DialogUtil {
  static showMsgDialog(
      {String? message,
      String? title,
      String? cancelTitle,
      BuildContext? context,
      Widget? content,
      Widget? image,
      Function? onSave,
      Function? onCancel,
      bool showCancelButton = false,
      List<DialogButton>? buttons}) async {
    await Alert(
      context: context ?? navigatorKey.currentState!.context,
      title: title ?? "Rich Pay",
      style: AlertStyle(
          titleStyle: AppTextStyle.darkBlueTextBold.copyWith(
            fontSize: 22.sp,
          ),
          animationType: AnimationType.fromRight),
      content: content ?? const SizedBox(),
      image: image,
      desc: message,
      buttons: buttons ??
          ([
            DialogButton(
              child: const Text(
                "موافق",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () async {
                if (onSave != null) await onSave();
                Navigator.pop(context ?? navigatorKey.currentState!.context);
              },
              width: 120,
              color: AppColors.mainAppColor,
            ),
            if (showCancelButton)
              DialogButton(
                child: Text(
                  cancelTitle ?? "الغاء",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async {
                  if (onCancel != null) await onCancel();
                  Navigator.pop(context ?? navigatorKey.currentState!.context);
                },
                width: 120,
                color: AppColors.mainAppColor,
              ),
          ]),
    ).show();
  }

  static void showDialogTextBox(
      {required String message,
      required BuildContext context,
      required Function onSave}) {
    TextEditingController value = TextEditingController();
    Alert(
      context: context,
      title: "ليجال",
      desc: message,
      buttons: [
        DialogButton(
          child: const Text(
            "موافق",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () async {
            await onSave(value.text);
            Navigator.pop(context);
          },
          width: 120,
          color: AppColors.mainAppColor,
        ),
      ],
      content: TextField(
        controller: value,
      ),
    ).show();
  }

  static void showDialogWidget({
    String? message,
    required BuildContext context,
    required Widget child,
    required Function onSave,
    String? buttonTxt,
  }) {
    Alert(
      context: context,
      title: "Rich Pay",
      desc: message,
      buttons: [
        DialogButton(
          child: Text(
            buttonTxt ?? "موافق",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () async {
            await onSave();
            // Navigator.pop(context);
          },
          width: 120,
          color: AppColors.mainAppColor,
        ),
      ],
      content: child,
    ).show();
  }

  static Future<void> showDatePickerDialog(
      {required BuildContext context,
      required DateRangePickerController controller,
      required Function onPickDate,
      enablePastDates = false,
      DateTime? maxDate}) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          // shape: BoxShape.rectangle,
          title: const Text("يرجى اختيار التاريخ"),
          content: SizedBox(
            height: 0.4.sh,
            width: 0.8.sw,
            child: SfDateRangePicker(
              controller: controller,
              enablePastDates: enablePastDates,
              // onSelectionChanged: (v) =>
              //     toggleDatePicker(date: v.value.toString()),
              selectionMode: DateRangePickerSelectionMode.single,
              // initialSelectedRange: PickerDateRange(
              //   DateTime.now().subtract(const Duration(days: 4)),
              //   DateTime.now().add(
              //     const Duration(
              //       days: 3,
              //     ),
              //   ),
              // ),
              maxDate: maxDate,
              onSubmit: (selectedDate) {
                onPickDate(selectedDate);
                // toggleDatePicker(date: v.toString());
              },
              onCancel: () {
                NavigateUtil.pop(context);
                // toggleDatePicker();
              },

              // onViewChanged: (v) {
              //   print(v);
              //   // toggleDatePicker(date: v.toString());
              // },
              showActionButtons: true,
              confirmText: 'حفظ',
              cancelText: 'الغاء',
            ),
          ),
        );
      },
      // message: 'message'
    );
  }

  static Future<void> showSelectTimeDialog(
      {required BuildContext context,
      required DateRangePickerController controller,
      required Function onPickDate}) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            NumberPicker(
              value: 2,
              minValue: 0,
              maxValue: 100, onChanged: (int value) {},
              // onChanged: (value) => setState(() => _currentValue = value),
            ),
            const Text('Current value: '),
          ],
        );
      },
      // message: 'message'
    );
  }
}
