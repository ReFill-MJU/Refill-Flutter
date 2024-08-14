import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refill_app/core/button/primary_button.dart';
import 'package:refill_app/core/theme/refill_theme_text_style.dart';

import '../theme/refill_theme_color.dart';

class WhiteButton extends ConsumerWidget {
  final String text;
  final VoidCallback onPressed;
  final bool enabled;

  const WhiteButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryButton(
      buttonChild: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          text,
          style: RefillThemeTextStyle.title1
              .copyWith(color: RefillThemeColor.sub90),
        ),
      ),
      onPressed: enabled ? onPressed : null,
      enabled: enabled,
      borderRadius: 12.0,
      backgroundColor:
          enabled ? RefillThemeColor.realWhite : RefillThemeColor.gray10,
      borderColor: RefillThemeColor.sub90,
      textColor: RefillThemeColor.white,
    );
  }
}
