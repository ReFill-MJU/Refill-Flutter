import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refill_app/presentation/add/view_model/add_info_notifier.dart';

import '../../../core/button/primary_button.dart';
import '../../../core/component/primary_calendar.dart';
import '../../../core/text_form_field/primary_text_form_field.dart';
import '../../../core/theme/refill_theme_color.dart';
import 'add_sub_title.dart';

class AddFirst extends ConsumerWidget {
  const AddFirst({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var addInfoNotifier = ref.read(addInfoNotifierProvider.notifier);
    var info = ref.watch(addInfoNotifierProvider);

    var isBoy = info.value?.isBoy ?? false;
    var isGirl = info.value?.isGirl ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AddSubTitle(text: "아이 이름을 입력해 주세요"),
        PrimaryTextFormField(
          initialValue: '',
          maxLines: 1,
          maxLength: 6,
          minLines: 1,
          onChanged: (value) {
            addInfoNotifier.updateName(value);
          },
        ),
        const SizedBox(
          height: 32.0,
        ),
        const AddSubTitle(text: "성별을 선택해 주세요"),
        Row(
          children: [
            PrimaryButton(
              onPressed: () {
                ref.read(addInfoNotifierProvider.notifier).updateIsBoy();
              },
              enabled: isBoy ? false : true,
              text: '남자',
              textColor:
                  isBoy ? RefillThemeColor.realWhite : RefillThemeColor.sub90,
              borderColor:
                  isBoy ? RefillThemeColor.realWhite : RefillThemeColor.sub90,
              backgroundColor:
                  isBoy ? RefillThemeColor.sub90 : RefillThemeColor.realWhite,
              borderRadius: 32.0,
            ),
            const SizedBox(
              width: 8.0,
            ),
            PrimaryButton(
              onPressed: () {
                ref.read(addInfoNotifierProvider.notifier).updateIsGirl();
              },
              enabled: isGirl ? false : true,
              text: '여자',
              textColor:
                  isGirl ? RefillThemeColor.realWhite : RefillThemeColor.sub90,
              borderColor:
                  isGirl ? RefillThemeColor.realWhite : RefillThemeColor.sub90,
              backgroundColor:
                  isGirl ? RefillThemeColor.sub90 : RefillThemeColor.realWhite,
              borderRadius: 32.0,
            ),
          ],
        ),
        const SizedBox(
          height: 32.0,
        ),
        const AddSubTitle(
          text: "아이가 태어난 날을 선택해 주세요",
        ),
        PrimaryCalender(
          onDateSelected: (DateTime value) {},
        ),
      ],
    );
  }
}
