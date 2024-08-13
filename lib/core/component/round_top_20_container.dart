import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoundVerticalContainer extends ConsumerWidget {
  const RoundVerticalContainer({
    super.key,
    this.top,
    this.bottom,
    this.color,
    required this.child,
  });

  final double? top;
  final double? bottom;
  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(top ?? 0.0),
              bottom: Radius.circular(bottom ?? 0.0)),
        ),
        color: color,
      ),
      child: child,
    );
  }
}
