import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/text_form_field/primary_text_form_field.dart';
import '../view_model/answer_notifier.dart';
import 'add_two_title.dart';

class AddThird extends ConsumerWidget {
  const AddThird({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AddTwoTitle(mainText: '주의 해야 할 사항이 있나요?'),
        const SizedBox(
          height: 16.0,
        ),
        PrimaryTextFormField(
          onChanged: (value) {
            ref.read(answerNotifierProvider.notifier).updateText(value);
          },
          maxLines: 10,
          hintText: '알레르기 또는 챙겨 먹는 약 등 주의 사항이 있다면 자세히 설명해 주세요',
        )
      ],
    );
  }
}
