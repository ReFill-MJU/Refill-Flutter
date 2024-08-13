import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refill_app/core/text_form_field/primary_text_form_field.dart';

class CareTextFormField extends ConsumerWidget {
  const CareTextFormField({super.key, this.focusNode});

  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryTextFormField(
        initialValue: '',
        maxLines: 1,
        minLines: 1,
        hintText: '선호하는 돌보미를 말씀해 주세요',
        onChanged: (value) {},
        focusNode: focusNode);
  }
}
