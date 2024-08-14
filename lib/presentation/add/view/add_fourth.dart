import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/text_form_field/primary_text_form_field.dart';
import '../view_model/answer_notifier.dart';
import 'add_two_title.dart';

class AddFourth extends ConsumerWidget {
  const AddFourth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AddTwoTitle(mainText: '좋아하는 것과 싫어하는 것은 무엇인가요?'),
        const SizedBox(
          height: 16.0,
        ),
        PrimaryTextFormField(
          onChanged: (value) {
            ref.read(answerNotifierProvider.notifier).updateText(value);
          },
          maxLines: 10,
          hintText: '취향에 대해 최대한 자세히 입력해 주세요',
        )
      ],
    );
  }
}
