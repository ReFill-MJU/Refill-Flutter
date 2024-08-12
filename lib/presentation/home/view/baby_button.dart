import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refill_app/core/theme/refill_theme_color.dart';

import '../../../core/button/primary_button.dart';

class BabyButton extends ConsumerWidget {
  const BabyButton(
      {super.key,
      required this.enabled,
      required this.text,
      required this.onPressed,
      required this.fontPadding,
      required this.padding});

  final bool enabled;

  final void Function()? onPressed;

  final String text;

  final double fontPadding;
  final double padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryButton(
      text: text,
      enabled: true,
      textColor: enabled ? RefillThemeColor.sub80 : RefillThemeColor.gray40,
      backgroundColor:
          enabled ? RefillThemeColor.sub10 : RefillThemeColor.gray10,
      borderColor:
          enabled ? RefillThemeColor.sub80 : RefillThemeColor.gray10,
      borderRadius: 25.0,
      onPressed: onPressed,
      fontPadding: fontPadding,
    );
  }
}
