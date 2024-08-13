import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/button/primary_button.dart';
import '../../../core/component/primary_calendar.dart';
import '../../../core/text_form_field/primary_text_form_field.dart';
import '../../../core/theme/refill_theme_color.dart';
import 'add_sub_title.dart';
import 'add_two_title.dart';

class AddThird extends ConsumerWidget {
  const AddThird({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddTwoTitle(mainText: '주의 해야 할 사항이 있나요?'),
        SizedBox(
          height: 16.0,
        ),
        PrimaryTextFormField(
          maxLines: 10,
          hintText: '알레르기 또는 챙겨 먹는 약 등 주의 사항이 있다면 자세히 설명해 주세요',
        )
      ],
    );
  }
}
