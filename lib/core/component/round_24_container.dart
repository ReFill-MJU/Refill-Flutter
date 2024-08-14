import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refill_app/core/theme/refill_theme_color.dart';

class Round24Container extends ConsumerWidget {
  const Round24Container({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: RefillThemeColor.sub40),
          borderRadius: BorderRadius.circular(24),
        ),
        color: RefillThemeColor.sub10,
      ),
      child: child,
    );
  }
}
