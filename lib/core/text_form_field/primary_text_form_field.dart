import 'package:flutter/material.dart';
import 'package:refill_app/core/theme/refill_theme_color.dart';

import '../base/base_text_form_field.dart';

class PrimaryTextFormField extends StatelessWidget
    implements BaseTextFormField {
  const PrimaryTextFormField({
    super.key,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.hintText,
    this.initialValue,
    this.onChanged,
    this.suffixIcon,
  });

  @override
  final String? hintText;
  @override
  final int? maxLength;
  @override
  final int? minLines;
  @override
  final int? maxLines;
  @override
  final String? initialValue;
  @override
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      expands: (minLines == null && maxLines == null) ? true : false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: RefillThemeColor.gray30,
        ),
        suffixIcon: suffixIcon,
        fillColor: RefillThemeColor.realWhite,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            color: RefillThemeColor.gray10,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            color: RefillThemeColor.sub90,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            color: RefillThemeColor.gray70,
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
