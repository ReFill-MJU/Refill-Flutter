import 'package:flutter/cupertino.dart';

abstract class BaseAppBar {
  Widget? get leading;

  double? get leadingWidth;

  Widget? get title;

  List<Widget>? get actions;

  bool? get centerTitle;

  ShapeBorder? get shape;
}
