import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refill_app/core/theme/refill_theme_color.dart';

class BasicPictureFix extends ConsumerWidget {
  const BasicPictureFix({super.key, required this.size, this.image});

  final double size;
  final String? image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: size,
      height: size,
      decoration: ShapeDecoration(
        color: RefillThemeColor.gray5,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: RefillThemeColor.gray10),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/image/img_finish.png'),
      ),
    );
  }
}
