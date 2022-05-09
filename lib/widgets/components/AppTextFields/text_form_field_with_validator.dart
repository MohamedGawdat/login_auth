import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/app_colors.dart';
import '../../../style/app_text_style.dart';
import '../../../utilities/life_cycle.dart';

// ignore: must_be_immutable
class TextFormFieldWithValidate extends StatefulWidget {
  final String hintText;
  final String labelText;

  final IconData prefixIcon;

  final TextInputType keyBoardType;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool isPasswordField;
  final bool isLoginScreen;
  final bool isEnabled;
  final bool isRepeatField;
  final bool? showInColumn;

  final int maxLines;
  final Function? callBack;
  final Function? onSubmit;
  const TextFormFieldWithValidate({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
    this.isPasswordField = false,
    required this.keyBoardType,
    required this.validator,
    this.inputFormatters,
    required this.controller,
    this.isLoginScreen = false,
    this.callBack,
    this.isEnabled = true,
    this.isRepeatField = false,
    this.showInColumn = false,
    this.maxLines = 1,
    this.onSubmit,
  }) : super(key: key);

  @override
  _TextFormFieldWithValidateState createState() =>
      _TextFormFieldWithValidateState();
}

class _TextFormFieldWithValidateState extends State<TextFormFieldWithValidate> {
  var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(
          color: Colors.grey, width: 2, style: BorderStyle.solid));
  // bool showElevation = true;
  bool showPassword = false;
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return FormField(
        enabled: false,
        // key: _formKey,

        validator: widget.validator,
        autovalidateMode: AutovalidateMode.disabled,
        builder: (field) {
          if (widget.controller.text != field.value) {
            field.setValue(widget.controller.text);
          }
          return AppLifecycleWidget(
            onMounted: () {
              _focusNode.addListener(() {
                if (!_focusNode.hasFocus) {
                  if (field.validate()) {
                  } else {}
                }
              });
            },
            builder: (context) => Material(
              // elevation: 0,
              color: Colors.transparent,
              // shadowColor: Colors.red.withOpacity(0.8),
              // borderRadius: BorderRadius.circular(18),
              child: Theme(
                data: Theme.of(context).copyWith(
                    splashColor: AppColors.greyColorUserDataBackGround),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.showInColumn!)
                      Column(
                        children: [
                          Text(
                            widget.hintText,
                            style: AppTextStyle.mediumGreyAppText,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    TextField(
                      inputFormatters: widget.inputFormatters,
                      focusNode: _focusNode,
                      enabled: widget.isEnabled,
                      controller: widget.controller,
                      maxLines: widget.maxLines,
                      keyboardType: widget.keyBoardType,
                      obscureText:
                          widget.isPasswordField ? !showPassword : false,
                      style:
                          AppTextStyle.textFieldStyle.copyWith(fontSize: 13.sp),
                      textInputAction: TextInputAction.send,
                      decoration: InputDecoration(
                        errorText: field.errorText,
                        errorMaxLines: 2,

                        // prefix: Icon(Icons.save),
                        // prefixIconConstraints: BoxConstraints(
                        //   maxHeight: 500
                        // ),
                        // errorStyle: widget.isRegesterField,
                        fillColor: widget.isEnabled
                            ? Colors.white
                            : AppColors.greyColorUserDataBackGround,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 14),
                        prefixIcon: widget.isLoginScreen
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: Icon(
                                  widget.prefixIcon,
                                  color: AppColors.mainAppColor,
                                ),
                              )
                            : null,

                        suffixIcon: widget.isPasswordField
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                icon: Icon(
                                  showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColors.sKyColor,
                                ))
                            : null,
                        labelText: widget.showInColumn!
                            ? null
                            : _focusNode.hasFocus
                                ? widget.labelText
                                : widget.hintText,
                        labelStyle: AppTextStyle.mediumGreyAppText,
                        hintText: widget.hintText,
                        hintStyle: AppTextStyle.textFieldHintStyle,
                        alignLabelWithHint: true,
                        border: outlineInputBorder,
                        enabledBorder: outlineInputBorder.copyWith(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 0.3,
                                style: BorderStyle.solid)),
                        focusedBorder: outlineInputBorder,
                      ),
                      onChanged: (_onChanged) {
                        field.didChange(_onChanged);
                        if (widget.callBack != null) {
                          widget.callBack!();
                        }
                        if (field.hasError) field.validate();
                        // if (widget.isRepeatField && field.hasError) field.validate();
                      },
                      onSubmitted: (value) {
                        field.didChange(value);
                        if (widget.callBack != null) {
                          widget.callBack!();
                        }
                        if (field.hasError) field.validate();
                      },

                      // validator: widget.validator,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
