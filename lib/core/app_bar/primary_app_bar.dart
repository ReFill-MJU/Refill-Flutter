import 'package:flutter/material.dart';
import 'package:refill_app/core/theme/refill_theme_color.dart';

import '../base/base_app_bar.dart';

class PrimaryAppBar extends StatelessWidget
    implements PreferredSizeWidget, BaseAppBar {
  const PrimaryAppBar(
      {super.key,
      this.leading,
      this.leadingWidth,
      this.title,
      this.actions,
      this.centerTitle,
      this.shape});

  @override
  final Widget? leading;
  @override
  final double? leadingWidth;
  @override
  final Widget? title;
  @override
  final List<Widget>? actions;
  @override
  final bool? centerTitle;
  @override
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      leadingWidth: leadingWidth,
      title: title,
      actions: actions,
      centerTitle: centerTitle,
      titleSpacing: 0,
      backgroundColor: RefillThemeColor.realWhite,
      elevation: 0.0,
      bottomOpacity: 0.0,
      scrolledUnderElevation: 0,
      shape: shape,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
