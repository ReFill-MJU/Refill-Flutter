import 'package:flutter/material.dart';

abstract class BaseTextFormField {
  int? get maxLength;

  int? get minLines;

  int? get maxLines;

  String? get hintText;

  String? get initialValue;

  ValueChanged<String>? get onChanged;
}
