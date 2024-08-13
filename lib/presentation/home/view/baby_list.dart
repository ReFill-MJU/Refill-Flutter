import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:refill_app/data/data_source/child_service.dart';
import 'package:refill_app/presentation/home/view/baby_button.dart';

import '../../../core/button/round_button.dart';
import '../../../core/theme/refill_theme_color.dart';

class BabyList extends ConsumerWidget {
  const BabyList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RoundButton(
            onPress: () {
              ChildService().childcareTest('너는 어디에 가장 전문적이라고 생각해? 어떤 질문을 해야 적절할 지 알려줘');
            },
            buttonChild: SvgPicture.asset(
              'assets/icon/ic_plus.svg',
            ),
            style: IconButton.styleFrom(
              backgroundColor: RefillThemeColor.sub90,
            ),
          ),
          const SizedBox(width: 8),
          BabyButton(
            enabled: true,
            text: '보름이',
            onPressed: () {},
            fontPadding: 0,
            padding: 16.0,
          ),
          const SizedBox(width: 6),
          BabyButton(
            enabled: false,
            text: '서아',
            onPressed: () {},
            fontPadding: 0,
            padding: 16.0,
          ),
          const SizedBox(width: 6),
          BabyButton(
            enabled: false,
            text: '상훈이',
            onPressed: () {},
            fontPadding: 0,
            padding: 16.0,
          ),
        ],
      ),
    );
  }
}
