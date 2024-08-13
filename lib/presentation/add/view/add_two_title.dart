import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refill_app/core/theme/refill_theme_color.dart';
import 'package:refill_app/core/theme/refill_theme_text_style.dart';

class AddTwoTitle extends ConsumerWidget {
  const AddTwoTitle({super.key, required this.mainText});

  final String mainText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          mainText,
          style: RefillThemeTextStyle.head2
              .copyWith(color: RefillThemeColor.sub90),
        ),
        const SizedBox(height: 4),
        Text(
          '설명에 따라 섬세한 AI가 생성 돼요!',
          style: RefillThemeTextStyle.title4
              .copyWith(color: RefillThemeColor.gray50),
        ),
      ],
    );
  }
}
