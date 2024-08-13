import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/button/primary_button.dart';
import '../../../core/component/primary_calendar.dart';
import '../../../core/text_form_field/primary_text_form_field.dart';
import '../../../core/theme/refill_theme_color.dart';
import 'add_sub_title.dart';
import 'add_two_title.dart';

class AddFourth extends ConsumerWidget {
  const AddFourth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddTwoTitle(mainText: '좋아하는 것과 싫어하는 것은 무엇인가요?'),
        SizedBox(
          height: 16.0,
        ),
        PrimaryTextFormField(
          maxLines: 10,
          hintText: '취향에 대해 최대한 자세히 입력해 주세요',
        )
      ],
    );
  }
}
