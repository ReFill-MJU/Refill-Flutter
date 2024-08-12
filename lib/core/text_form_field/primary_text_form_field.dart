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
    this.errorText,
    this.errorBorder,
    this.errorStyle,
    this.onChanged,
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
  final String? errorText;
  @override
  final OutlineInputBorder? errorBorder;
  @override
  final TextStyle? errorStyle;
  @override
  final ValueChanged<String>? onChanged;

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
          color: RefillThemeColor.gray60,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: RefillThemeColor.gray90,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: RefillThemeColor.primary90,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: RefillThemeColor.gray70,
          ),
        ),
        errorText: errorText,
        errorBorder: errorBorder,
        errorStyle: errorStyle,
      ),
      onChanged: onChanged,
    );
  }
}
