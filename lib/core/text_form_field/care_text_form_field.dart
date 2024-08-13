import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refill_app/core/text_form_field/primary_text_form_field.dart';

class CareTextFormField extends ConsumerWidget {
  const CareTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryTextFormField(
      initialValue: '',
      maxLines: 1,
      minLines: 1,
      hintText: '여기에 입력해 주세요',
      onChanged: (value) {},
    );
  }
}
