import 'package:flutter/material.dart';
import 'package:social_media/modules/widgets/input_field_label.dart';

import '../../shared/config/app_colors.dart';
import '../../shared/config/app_styles.dart';

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType inputType;
  final IconData? prefix;
  final bool isPassword;
  final IconData? suffix;
  final dynamic suffixPressed;
  final String? Function(String?) validate;
  TextEditingController textController = TextEditingController();

  // ignore: use_key_in_widget_constructors
  InputField({
    required this.textController,
    required this.label,
    this.hint = "",
    this.inputType = TextInputType.text,
    this.prefix,
    this.isPassword = false,
    this.suffix,
    this.suffixPressed,
    required this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputFieldLabel(label),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: TextFormField(
              controller: textController,
              keyboardType: inputType,
              obscureText: isPassword,
              validator: validate,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.MAIN, width: 0.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: AppColors.INPUT_FIELD_BG,
                filled: true,
                hintText: hint,
                hintStyle: AppStyles.input_label,
                prefixIcon: Icon(
                  prefix,
                  size: 15,
                ),
                suffixIcon: suffix != null
                    ? IconButton(onPressed: suffixPressed, icon: Icon(suffix , size: 15,))
                    : null,
              ),
            ),
          )
        ],
      ),
    );
  }
}
