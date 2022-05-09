import 'package:bottom_picker/bottom_picker.dart';
// ignore_for_file: avoid_print
import 'package:bottom_picker/resources/arrays.dart';

import '../../main.dart';
import '../../style/app_text_style.dart';

class BottomDateBicker {
  static showDatePicker({required String title, required Function onSubmit}) {
    BottomPicker.date(
            title: title,
            titleStyle: AppTextStyle.mainTextStyle,
            onChange: (index) {
              // print(index);
            },
            onSubmit: (index) {
              onSubmit(index);
            },
            bottomPickerTheme: BOTTOM_PICKER_THEME.plumPlate)
        .show(
      navigatorKey.currentState!.context,
    );
  }
}
