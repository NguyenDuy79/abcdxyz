import 'package:flutter/cupertino.dart';
import '../../../core/resource/app_colors.dart';
import '../../../core/resource/app_dimens.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      this.funtion, this.hint, this.textInputType, this.prefix, this.autoFocus,
      {super.key});

  final String hint;
  final Function(String value) funtion;
  final TextInputType textInputType;
  final Widget prefix;
  final bool autoFocus;
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      onChanged: funtion,
      // focusNode: focusNode,
      autofocus: autoFocus,
      placeholder: hint,
      cursorColor: AppColor.black.withOpacity(0.2),
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      prefix: prefix,
      keyboardType: textInputType,
      decoration: BoxDecoration(
          color: AppColor.grey1,
          borderRadius: BorderRadius.circular(AppDimens.dimens_8),
          border: Border.all(
              width: AppDimens.dimens_1,
              color: AppColor.black.withOpacity(0.2))),
    );
  }
}
