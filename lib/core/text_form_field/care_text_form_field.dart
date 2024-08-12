import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refill_app/core/text_form_field/primary_text_form_field.dart';

class CareTextFormField extends ConsumerWidget {
  const CareTextFormField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryTextFormField(
      initialValue: '',
      maxLines: 1,
      minLines: 1,
      hintText: '',
      onChanged: (value) {},
    );
  }
}
