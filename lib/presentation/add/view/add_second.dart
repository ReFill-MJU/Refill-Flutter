import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refill_app/core/text_form_field/primary_text_form_field.dart';
import 'package:refill_app/presentation/add/view/add_two_title.dart';

class AddSecond extends ConsumerWidget {
  const AddSecond({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddTwoTitle(mainText: '어떠한 성격을 가지고 있나요?'),
        SizedBox(
          height: 16.0,
        ),
        PrimaryTextFormField(
          maxLines: 10,
          hintText: '성격을 최대한 자세히 입력해 주세요',
        )
      ],
    );
  }
}
