import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:refill_app/core/button/round_button.dart';
import 'package:refill_app/core/theme/refill_theme_color.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RoundButton(
              onPress: () {},
              buttonChild: SvgPicture.asset(
                'assets/icon/ic_plus.svg',
              ),
              style: IconButton.styleFrom(
                backgroundColor: RefillThemeColor.sub90,
              ),
            )
          ],
        ),
      ),
    );
  }
}
