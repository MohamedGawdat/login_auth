import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectAvatar extends StatefulWidget {
  final Function onPress;
  final String defaultImagePath;
  final String? oldImage;
  const SelectAvatar(
      {Key? key,
      required this.onPress,
      required this.defaultImagePath,
      this.oldImage})
      : super(key: key);

  @override
  _SelectAvatarState createState() => _SelectAvatarState();
}

class _SelectAvatarState extends State<SelectAvatar> {
  FilePickerResult? file;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: InkWell(
        onTap: () async {
          setState(() async {
            file = await FilePicker.platform.pickFiles(
              type: FileType.image,
              allowCompression: true,
              allowMultiple: false,
              // dialogTitle: 'test',
            );
          });

          widget.onPress(file!.files[0].path!);
        },
        child: file != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 0.2.sw,
                    backgroundImage: FileImage(
                      File(
                        file!.files[0].path!,
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ],
              )
            : widget.oldImage != null
                ? CircleAvatar(
                    radius: 0.2.sw,
                    backgroundImage: NetworkImage(widget.oldImage!))
                : Image.asset(
                    widget.defaultImagePath,
                    width: 0.4.sw,
                    height: 0.4.sw,
                  ),
      ),
    );
  }
}
