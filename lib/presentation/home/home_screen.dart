import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refill_app/core/app_bar/logo_app_bar.dart';
import 'package:refill_app/core/component/round_24_container.dart';
import 'package:refill_app/presentation/home/view/baby_list.dart';

import '../../core/text_form_field/care_text_form_field.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: LogoAppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BabyList(),
            SizedBox(
              height: 8.0,
            ),
            Round24Container(),
            CareTextFormField(),
          ],
        ),
      ),
    );
  }
}
