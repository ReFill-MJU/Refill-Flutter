import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:refill_app/core/text_form_field/primary_text_form_field.dart';
import 'package:refill_app/presentation/home/view_model/ai_message_notifier.dart';

import '../../presentation/add/view_model/answer_notifier.dart';
import '../../presentation/home/view_model/seleceted_provider.dart';

class CareTextFormField extends ConsumerWidget {
  const CareTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedChildId = ref.watch(selectedChildIdProvider);

    var answer = ref.watch(answerNotifierProvider);
    bool enabled = answer.value?.fieldNotEmpty ?? false;
    return PrimaryTextFormField(
      initialValue: '',
      maxLines: 1,
      minLines: 1,
      suffixIcon: IconButton(
        onPressed: enabled
            ? () {
                ref.read(aiMessageNotifierProvider.notifier).postMessage(
                    selectedChildId!,
                    ref.read(answerNotifierProvider).value!.field);
                ref.invalidate(aiMessageNotifierProvider);
                ref.invalidate(answerNotifierProvider);
              }
            : () {},
        icon: SvgPicture.asset(
          enabled ? 'assets/icon/ic_send_true.svg' : 'assets/icon/ic_send.svg',
        ),
      ),
      hintText: '여기에 입력해 주세요',
      onChanged: (value) {
        ref.read(answerNotifierProvider.notifier).updateText(value);
      },
    );
  }
}
