import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refill_app/core/base/bouncing.dart';

class RoundButton extends ConsumerWidget {
  const RoundButton(
      {super.key,
      required this.onPress,
      required this.buttonChild,
      required this.style});

  final Function() onPress;
  final Widget buttonChild;
  final ButtonStyle style;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Bouncing(
      child: IconButton(
        onPressed: onPress,
        icon: buttonChild,
        style: style,
      ),
    );
  }
}
