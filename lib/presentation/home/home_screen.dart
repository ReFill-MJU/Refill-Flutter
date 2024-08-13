import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refill_app/core/app_bar/logo_app_bar.dart';
import 'package:refill_app/core/component/round_top_20_container.dart';
import 'package:refill_app/core/theme/refill_theme_color.dart';
import 'package:refill_app/core/theme/refill_theme_text_style.dart';

import '../../core/text_form_field/care_text_form_field.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const LogoAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundVerticalContainer(
              top: 20.0,
              color: RefillThemeColor.sub90,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      '나만의 돌보미 매칭을 위한 AI 서비스',
                      style: RefillThemeTextStyle.body7
                          .copyWith(color: RefillThemeColor.realWhite),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '어떤 돌보미를 매칭해 드릴까요?',
                      style: RefillThemeTextStyle.title1
                          .copyWith(color: RefillThemeColor.realWhite),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(color: RefillThemeColor.sub10),
              ),
            ),
            RoundVerticalContainer(
              bottom: 20.0,
              color: RefillThemeColor.sub10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const CareTextFormField(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
