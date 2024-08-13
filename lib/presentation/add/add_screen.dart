import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refill_app/core/button/primary_button.dart';
import 'package:refill_app/core/button/yellow_button.dart';
import 'package:refill_app/core/text_form_field/primary_text_form_field.dart';
import 'package:refill_app/presentation/add/view/add_sub_title.dart';

import '../../core/app_bar/back_left_title_app_bar.dart';
import '../../core/component/primary_calendar.dart';
import '../../core/theme/refill_theme_color.dart';

class AddScreen extends ConsumerWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: const BackLeftTitleAppBar(
          title: "아이 등록",
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AddSubTitle(text: "아이 이름을 입력해 주세요"),
                      const PrimaryTextFormField(
                        initialValue: '',
                        maxLines: 1,
                        maxLength: 6,
                        minLines: 1,
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      const AddSubTitle(text: "성별을 선택해 주세요"),
                      const Row(
                        children: [
                          PrimaryButton(
                            enabled: true,
                            text: '남자',
                            textColor: RefillThemeColor.sub90,
                            borderColor: RefillThemeColor.sub90,
                            borderRadius: 32.0,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          PrimaryButton(
                            enabled: true,
                            text: '여자',
                            textColor: RefillThemeColor.sub90,
                            borderColor: RefillThemeColor.sub90,
                            borderRadius: 32.0,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      const AddSubTitle(text: "아이가 태어난 날을 선택해 주세요"),
                      PrimaryCalender(
                        onDateSelected: (DateTime value) {},
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: double.infinity,
                    child: YellowButton(
                        text: '다음', onPressed: () {}, enabled: true),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
