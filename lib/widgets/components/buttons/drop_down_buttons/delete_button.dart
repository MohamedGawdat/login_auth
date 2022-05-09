import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../style/app_text_style.dart';
import '../../../../utilities/alert_dialog.dart';
import '../../../../utilities/navigation_util.dart';

class AppDeleteButton extends StatelessWidget {
  final Function onDelete;
  final Widget? deleteAlertImage;
  final String? alertTitle;
  final String? alertMsg;
  final Widget? deleteAlertWidget;
  final bool hasPermission;
  const AppDeleteButton({
    Key? key,
    required this.onDelete,
    required this.hasPermission,
    this.deleteAlertImage,
    this.alertTitle,
    this.alertMsg,
    this.deleteAlertWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return hasPermission
        ? InkWell(
            onTap: () async {
              DialogUtil.showMsgDialog(
                context: context,
                title: alertTitle,
                message: alertMsg,
                content: deleteAlertWidget,
                image: deleteAlertImage,
                onSave: () async {
                  EasyLoading.show(status: 'جاري الحذف');
                  await onDelete();
                  EasyLoading.dismiss();
                  NavigateUtil.pop(context);
                  // return deleted;
                },
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/delete.png'),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'حذف',
                  style: AppTextStyle.mainTextStyle.copyWith(fontSize: 20),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
