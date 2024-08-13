import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refill_app/core/app_bar/logo_app_bar.dart';
import 'package:refill_app/core/component/round_top_20_container.dart';
import 'package:refill_app/core/text_form_field/care_text_form_field.dart';
import 'package:refill_app/core/theme/refill_theme_color.dart';
import 'package:refill_app/core/theme/refill_theme_text_style.dart';
import 'package:refill_app/presentation/home/view/baby_info.dart';
import 'package:refill_app/presentation/home/view/baby_list.dart';

import '../../core/button/yellow_button.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key, required this.name, this.profileImage});

  final String name;
  final String? profileImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const LogoAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BabyList(),
                        const SizedBox(
                          height: 8.0,
                        ),
                        const BabyInfo(),
                        const SizedBox(
                          height: 16.0,
                        ),
                        RoundVerticalContainer(
                          top: 20.0,
                          color: RefillThemeColor.primary40,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  '보름이를 위한 aI 서비스',
                                  style: RefillThemeTextStyle.body4.copyWith(
                                      color: RefillThemeColor.realWhite),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '보육 전문가 늘봄과 함께해요',
                                  style: RefillThemeTextStyle.title1.copyWith(
                                      color: RefillThemeColor.realWhite),
                                ),
                              ],
                            ),
                          ),
                        ),
                        RoundVerticalContainer(
                          bottom: 20.0,
                          color: RefillThemeColor.sub10,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                const RoundVerticalContainer(
                                  child: SizedBox(
                                    height: 50,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: SvgPicture.asset(
                                        'assets/icon/ic_sound.svg',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4.0,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: SvgPicture.asset(
                                        'assets/icon/ic_send.svg',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const CareTextFormField(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: YellowButton(
                                text: '함께하기', onPressed: () {}, enabled: true),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
