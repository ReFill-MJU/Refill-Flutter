import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refill_app/core/component/basic_picture_fix.dart';
import 'package:refill_app/core/theme/refill_theme_color.dart';

import '../theme/refill_theme_text_style.dart';

class Round24Container extends ConsumerWidget {
  const Round24Container({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: RefillThemeColor.sub40),
            borderRadius: BorderRadius.circular(24),
          ),
          color: RefillThemeColor.sub10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const BasicPictureFix(size: 93),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/icon/ic_boy.svg'),
                        const SizedBox(
                          width: 8.0,
                        ),
                        const Text('보름이', style: RefillThemeTextStyle.head1),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          '1살',
                          style: RefillThemeTextStyle.body6.copyWith(
                            color: RefillThemeColor.sub90,
                          ),
                        )
                      ],
                    ),
                    Text(
                      '아장아장',
                      style: RefillThemeTextStyle.body6
                          .copyWith(color: RefillThemeColor.gray40),
                    ),
                    Row(
                      children: [
                        const Text('2024-01-01',
                            style: RefillThemeTextStyle.body6),
                        const SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          '+28일',
                          style: RefillThemeTextStyle.body3
                              .copyWith(color: RefillThemeColor.sub90),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
