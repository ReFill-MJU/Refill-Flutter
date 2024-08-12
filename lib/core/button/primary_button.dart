import 'package:flutter/material.dart';

import '../base/base_button.dart';
import '../base/bouncing.dart';

class PrimaryButton extends StatelessWidget implements BaseButton {
  @override
  final double? width;
  @override
  final double? height;
  @override
  final String? text;
  @override
  final VoidCallback? onPressed;
  @override
  final bool enabled;
  @override
  final Color? textColor;
  @override
  final Color backgroundColor;
  @override
  final Color borderColor;
  @override
  final double? borderRadius;
  @override
  final double? fontSize;
  @override
  final Widget? buttonChild;
  @override
  final double? fontPadding;

  const PrimaryButton(
      {super.key,
      this.width,
      this.height,
      this.text,
      this.onPressed,
      required this.enabled,
      this.textColor,
      required this.backgroundColor,
      required this.borderColor,
      this.borderRadius,
      this.fontSize,
      this.buttonChild,
      this.fontPadding});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: enabled
          ? Bouncing(
              onPress: () {},
              child: TextButton(
                onPressed: onPressed,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(backgroundColor),
                  side: WidgetStateProperty.resolveWith(
                    (states) {
                      return BorderSide(
                        color: borderColor,
                        width: 1.0,
                      );
                    },
                  ),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: borderRadius == null
                          ? BorderRadius.circular(8.0)
                          : BorderRadius.circular(borderRadius!),
                    ),
                  ),
                ),
                child: buttonChild == null
                    ? Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: fontPadding ?? 8.0),
                        child: Text(
                          text!,
                          style: TextStyle(
                            color: textColor,
                            fontSize: fontSize,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : buttonChild!,
              ),
            )
          : TextButton(
              onPressed: null,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(backgroundColor),
                side: WidgetStateProperty.resolveWith(
                  (states) {
                    return BorderSide(
                      color: borderColor,
                      width: 1.0,
                    );
                  },
                ),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: borderRadius == null
                        ? BorderRadius.circular(8.0)
                        : BorderRadius.circular(borderRadius!),
                  ),
                ),
              ),
              child: buttonChild == null
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: fontPadding ?? 8.0),
                      child: Text(
                        text!,
                        style: TextStyle(
                          color: textColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : buttonChild!,
            ),
    );
  }
}
