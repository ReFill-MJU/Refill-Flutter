import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/button/primary_button.dart';
import '../../../core/component/primary_calendar.dart';
import '../../../core/text_form_field/primary_text_form_field.dart';
import '../../../core/theme/refill_theme_color.dart';
import 'add_sub_title.dart';

class AddFirst extends ConsumerWidget {
  const AddFirst({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
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
    );
  }
}
