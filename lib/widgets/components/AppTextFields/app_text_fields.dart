import 'package:flutter/material.dart';
import 'text_form_field_with_validator.dart';
import 'validators/RegExp/validators.dart';

enum Lang { ARABIC, ENGLISH }

class AppTextFieldEmail extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final bool isRequired;
  final Function? callBack;
  final bool? showInColumn;

  final bool enabled;

  const AppTextFieldEmail({
    Key? key,
    required this.controller,
    this.title = 'البريد الإلكتروني',
    this.isRequired = true,
    this.callBack,
    this.enabled = true,
    this.showInColumn = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWithValidate(
      callBack: callBack,
      controller: controller,
      hintText: title + (isRequired && enabled ? ' *' : ''),
      labelText: title,
      keyBoardType: TextInputType.emailAddress,
      prefixIcon: Icons.mail,
      validator: AppValidators.validateEmail(
        isRequired: isRequired,
      ),
      isEnabled: enabled,
      isLoginScreen: true,
      isRepeatField: false,
      showInColumn: showInColumn,
      maxLines: 1,
    );
  }
}

class AppTextFieldRepEmail extends StatelessWidget {
  final TextEditingController controller;
  final String rEmail;
  final Function callBack;
  // final bool? showInColumn;

  const AppTextFieldRepEmail(
      {Key? key,
      required this.controller,
      required this.rEmail,
      required this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWithValidate(
      callBack: callBack,
      controller: controller,
      hintText: 'بريد المستخدم',
      labelText: 'بريد المستخدم',
      keyBoardType: TextInputType.emailAddress,
      prefixIcon: Icons.mail,
      validator: AppValidators.validateREmail(rEmail),
      isEnabled: true,
      isLoginScreen: true,
      isRepeatField: false,
      maxLines: 1,
    );
  }
}

class AppTextFieldPassword extends StatelessWidget {
  final TextEditingController controller;
  final Function? callBack;
  final bool? showInColumn;

  const AppTextFieldPassword(
      {Key? key,
      required this.controller,
      this.callBack,
      this.showInColumn = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWithValidate(
      callBack: callBack,
      controller: controller,
      hintText: 'Password *',
      labelText: 'Password',
      isPasswordField: true,
      keyBoardType: TextInputType.visiblePassword,
      prefixIcon: Icons.lock,
      validator: AppValidators.validatePassWord(),
      isEnabled: true,
      isLoginScreen: true,
      isRepeatField: false,
      showInColumn: showInColumn,
      maxLines: 1,
    );
  }
}

class AppTextFieldRepPassword extends StatelessWidget {
  final TextEditingController controller;
  final Function? callBack;
  final String rPassword;

  const AppTextFieldRepPassword({
    Key? key,
    required this.controller,
    required this.rPassword,
    this.callBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWithValidate(
      callBack: callBack,
      controller: controller,
      hintText: 'تأكيد كلمة المرور *',
      labelText: 'تأكيد كلمة المرور',
      isPasswordField: true,
      keyBoardType: TextInputType.visiblePassword,
      prefixIcon: Icons.lock,
      validator: (value) {
        return null;
      },
      // validator: AppValidators.validateRPassWord(rPassword),
      isEnabled: true,
      isLoginScreen: true,
      isRepeatField: false,
      maxLines: 1,
    );
  }
}

class AppTextFieldName extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final Function? callBack;
  final bool? isRequired;
  final bool? showInColumn;
  final bool isEnable;
  final int? uniqueMaxCount;
  final Function? onSubmit;
  const AppTextFieldName({
    Key? key,
    required this.controller,
    this.title = 'الاسم',
    this.callBack,
    this.isRequired = false,
    this.isEnable = true,
    this.showInColumn = false,
    this.uniqueMaxCount,
    this.onSubmit,
  }) : super(key: key);

  @override
  State<AppTextFieldName> createState() => _AppTextFieldNameState();
}

class _AppTextFieldNameState extends State<AppTextFieldName> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormFieldWithValidate(
          isEnabled: widget.isEnable,
          callBack: widget.callBack ??
              () {
                // setState(() {});
              },
          onSubmit: () {
            if (widget.onSubmit != null) {
              widget.onSubmit!();
            }
          },
          controller: widget.controller,
          hintText: widget.title + (widget.isRequired! ? ' *' : ''),
          labelText: widget.title,
          keyBoardType: TextInputType.name,
          prefixIcon: Icons.person,
          validator: AppValidators.validateName(
              isRequired: widget.isRequired!,
              uniqueMaxCount: widget.uniqueMaxCount ?? 150),
          // inputFormatters: [
          //   FilteringTextInputFormatter.allow(
          //       RegExp('([a-zA-Z]{1,})+( ([a-zA-Z])+)*\$')),
          // ],
          isLoginScreen: true,
          isRepeatField: false,
          showInColumn: widget.showInColumn!,
          maxLines: 1,
        ),
        if (widget.uniqueMaxCount != null)
          CountDown(
            inUse: widget.controller.text.length,
            total: widget.uniqueMaxCount,
          )
      ],
    );
  }
}

class AppTextFieldTitleOrLabel extends StatefulWidget {
  final dynamic title;
  final TextEditingController controller;
  final Function? callBack;
  final bool isRequired;
  final bool isEnabled;
  final int? uniqueMaxCount;
  final bool showCounter;
  final bool? showInColumn;

  final Lang? labelLang;

  const AppTextFieldTitleOrLabel({
    Key? key,
    required this.controller,
    this.callBack,
    required this.title,
    this.isRequired = true,
    this.isEnabled = true,
    this.uniqueMaxCount,
    this.showCounter = true,
    this.showInColumn = false,
    this.labelLang,
  }) : super(key: key);

  @override
  State<AppTextFieldTitleOrLabel> createState() =>
      _AppTextFieldTitleOrLabelState();
}

class _AppTextFieldTitleOrLabelState extends State<AppTextFieldTitleOrLabel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormFieldWithValidate(
          callBack: () {
            if (widget.callBack != null) widget.callBack!();
            setState(() {});
          },
          controller: widget.controller,
          hintText: widget.title +
              (widget.isRequired && widget.isEnabled ? ' *' : ''),
          labelText: widget.title,
          keyBoardType: TextInputType.text,
          prefixIcon: Icons.note_alt_outlined,
          validator: AppValidators.validateTitlesOrLabels(
              isRequired: widget.isRequired,
              uniqueMaxCount: widget.uniqueMaxCount,
              labelLang: widget.labelLang),
          isEnabled: widget.isEnabled,
          isLoginScreen: true,
          isRepeatField: false,
          showInColumn: widget.showInColumn,
          maxLines: 1,
        ),
        if (widget.uniqueMaxCount != null && widget.showCounter)
          CountDown(
            inUse: widget.controller.text.length,
            total: widget.uniqueMaxCount,
          )
      ],
    );
  }
}

class AppTextFieldMultiLine extends StatefulWidget {
  final String title;
  final int? maxCount;
  final TextEditingController controller;
  final Function? callBack;
  final bool isRequired;
  final bool showCounter;

  const AppTextFieldMultiLine({
    Key? key,
    required this.controller,
    this.maxCount = 250,
    this.callBack,
    this.isRequired = true,
    this.showCounter = true,
    required this.title,
  }) : super(key: key);

  @override
  State<AppTextFieldMultiLine> createState() => _AppTextFieldMultiLineState();
}

class _AppTextFieldMultiLineState extends State<AppTextFieldMultiLine> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormFieldWithValidate(
          callBack: () {
            if (widget.callBack != null) widget.callBack!();
            setState(() {});
          },
          controller: widget.controller,
          hintText: widget.title,
          labelText: widget.title,
          prefixIcon: Icons.bookmark,
          keyBoardType: TextInputType.multiline,
          validator: AppValidators.validateLongMsg(
            isRequired: widget.isRequired,
            maxCount: widget.maxCount,
          ),
          isEnabled: true,
          isLoginScreen: false,
          isRepeatField: false,
          maxLines: 5,
        ),
        const SizedBox(
          height: 5,
        ),
        if (widget.showCounter)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                  '${(widget.maxCount ?? 250).toString()}/${widget.controller.text.length}')
            ],
          ),
      ],
    );
  }
}

class AppTextFieldNumber extends StatefulWidget {
  final dynamic title;
  final TextEditingController controller;
  final Function? callBack;
  final bool isRequired;
  final int? uniqueMaxCount;

  const AppTextFieldNumber(
      {Key? key,
      required this.controller,
      this.callBack,
      this.title = 'رمز التأكيد',
      this.isRequired = true,
      this.uniqueMaxCount})
      : super(key: key);

  @override
  State<AppTextFieldNumber> createState() => _AppTextFieldNumberState();
}

class _AppTextFieldNumberState extends State<AppTextFieldNumber> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormFieldWithValidate(
          callBack: () {
            if (widget.callBack != null) widget.callBack!();
            setState(() {});
          },
          controller: widget.controller,
          hintText: widget.title + (widget.isRequired ? ' *' : ''),
          labelText: widget.title,
          keyBoardType: TextInputType.number,
          prefixIcon: Icons.timelapse,
          validator: AppValidators.validateNumber(
              // isRequired: widget.isRequired,
              // uniqueMaxCount: widget.uniqueMaxCount
              ),
          isEnabled: true,
          isLoginScreen: true,
          isRepeatField: false,
          maxLines: 1,
        ),
        if (widget.uniqueMaxCount != null)
          CountDown(
            inUse: widget.controller.text.length,
            total: widget.uniqueMaxCount,
          )
      ],
    );
  }
}

class AppTextFieldMobilePhone extends StatelessWidget {
  final dynamic title;
  final TextEditingController controller;
  final Function? callBack;
  final bool isRequired;
  final bool isEnabled;
  final bool? showInColumn;

  final int? uniqueMaxCount;

  const AppTextFieldMobilePhone(
      {Key? key,
      required this.controller,
      this.callBack,
      this.title = 'رقم المحمول',
      this.isRequired = true,
      this.isEnabled = true,
      this.showInColumn = false,
      this.uniqueMaxCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWithValidate(
      callBack: () {
        if (callBack != null) callBack!();
        // setState(() {});
      },
      controller: controller,
      hintText: title + (isRequired && isEnabled ? ' *' : ''),
      labelText: title,
      keyBoardType: TextInputType.number,
      prefixIcon: Icons.phone_iphone,
      validator: AppValidators.validatePhone(isRequired: isRequired
          // isRequired: widget.isRequired,
          // uniqueMaxCount: widget.uniqueMaxCount
          ),
      isEnabled: isEnabled,
      isLoginScreen: true,
      isRepeatField: false,
      showInColumn: showInColumn,
      maxLines: 1,
    );
  }
}

class AppTextFieldIdentifierPaspor extends StatelessWidget {
  final dynamic title;
  final TextEditingController controller;
  final Function? callBack;
  final bool isRequired;
  final bool isEnabled;
  final bool? showInColumn;

  final int? uniqueMaxCount;

  const AppTextFieldIdentifierPaspor(
      {Key? key,
      required this.controller,
      this.callBack,
      required this.title,
      this.isRequired = true,
      this.isEnabled = true,
      this.showInColumn = false,
      this.uniqueMaxCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWithValidate(
        controller: controller,
        hintText: 'رقم الهوية *',
        labelText: 'رقم الهوية',
        prefixIcon: Icons.person,
        isPasswordField: false,
        isEnabled: isEnabled,
        showInColumn: showInColumn,
        keyBoardType: TextInputType.emailAddress,
        callBack: () {},
        validator: AppValidators.validatePassPor()
        // provider.fetchedIdentifyTypes
        //     .selectedIdentify!.id ==
        //     1
        //     ? AppValidators.validateNID()
        //     : AppValidators.validatePassPor(),
        );
  }
}

class CountDown extends StatelessWidget {
  final int? inUse;
  final int? total;
  const CountDown({Key? key, this.inUse, this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text('$total/${inUse ?? 0}')],
        ),
      ],
    );
  }
}
