import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:refill_app/core/component/round_24_container.dart';

import '../../../core/component/basic_picture_fix.dart';
import '../../../core/theme/refill_theme_color.dart';
import '../../../core/theme/refill_theme_text_style.dart';

class BabyInfo extends ConsumerWidget {
  const BabyInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Round24Container(
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
                        Text(
                          '보름이',
                          style: RefillThemeTextStyle.head1.copyWith(
                            color: RefillThemeColor.primary50,
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          '한 살',
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
                        Text(
                          '2024-01-01',
                          style: RefillThemeTextStyle.body6.copyWith(
                            color: RefillThemeColor.gray70,
                          ),
                        ),
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
