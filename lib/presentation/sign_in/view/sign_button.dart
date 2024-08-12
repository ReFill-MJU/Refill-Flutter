import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:refill_app/core/theme/refill_theme_color.dart';

import '../../../core/button/primary_button.dart';

class SignInButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final BorderSide? borderSide;
  final Color? borderColor;
  final SvgPicture svgPicture;
  final String text;

  const SignInButton({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.borderSide,
    this.borderColor,
    required this.svgPicture,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: PrimaryButton(
        enabled: true,
        onPressed: onPressed,
        borderRadius: 5,
        backgroundColor: backgroundColor ?? RefillThemeColor.naverColor,
        borderColor: borderColor ?? RefillThemeColor.naverColor,
        buttonChild: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            svgPicture,
            Text(
              text,
              style: const TextStyle(color: RefillThemeColor.realWhite),
            ),
            const SizedBox(
              width: 24.0,
            )
          ],
        ),
      ),
    );
  }
}
