import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:refill_app/core/app_bar/logo_app_bar.dart';
import 'package:refill_app/core/button/primary_button.dart';
import 'package:refill_app/core/button/yellow_button.dart';
import 'package:refill_app/core/component/round_top_20_container.dart';
import 'package:refill_app/core/text_form_field/care_text_form_field.dart';
import 'package:refill_app/core/theme/refill_theme_color.dart';
import 'package:refill_app/core/theme/refill_theme_text_style.dart';
import 'package:refill_app/data/model/my_child_list_model.dart';
import 'package:refill_app/presentation/add/add_screen.dart';
import 'package:refill_app/presentation/home/view/baby_info.dart';
import 'package:refill_app/presentation/home/view/baby_list.dart';
import 'package:refill_app/presentation/home/view_model/my_child_list_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<MyChildListModel>> childList =
        ref.watch(myChildListModelProvider);

    return Scaffold(
      appBar: const LogoAppBar(),
      body: childList.when(
        data: (data) {
          return data.isNotEmpty
              ? Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
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
                                            '우리 아이 맞춤형 AI 서비스',
                                            style: RefillThemeTextStyle.body4
                                                .copyWith(
                                                    color: RefillThemeColor
                                                        .realWhite),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            '보육 전문가 늘봄과 함께해요',
                                            style: RefillThemeTextStyle.title1
                                                .copyWith(
                                              color: RefillThemeColor.realWhite,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 1000,
                                    decoration: const BoxDecoration(
                                      color: RefillThemeColor.sub10,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 16.0, left: 16.0, right: 16.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: RefillThemeColor.sub10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    PrimaryButton(
                                      enabled: true,
                                      text: '👼🏻 아이를 위한 복지 사업을 추천해줘',
                                      textColor: RefillThemeColor.sub90,
                                      borderColor: RefillThemeColor.sub90,
                                      borderRadius: 32.0,
                                    ),
                                  ],
                                ),
                                Row(
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
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                  ],
                                ),
                              ],
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
                  ],
                )
              : Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 64.0,
                      ),
                      Image.asset('assets/image/img_finish.png'),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        '아직 아이가 없어요!',
                        style: RefillThemeTextStyle.title2
                            .copyWith(color: RefillThemeColor.primary60),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        '내 아이를 등록하고\n맞춤형 AI 늘봄이에게 정보를 얻어 보세요',
                        style: RefillThemeTextStyle.body2
                            .copyWith(color: RefillThemeColor.gray60),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: YellowButton(
                            text: '등록하기',
                            enabled: true,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (builder) => const AddScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}
