import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:refill_app/core/app_bar/primary_app_bar.dart';
import 'package:refill_app/core/button/yellow_button.dart';
import 'package:refill_app/core/theme/refill_theme_color.dart';
import 'package:refill_app/core/theme/refill_theme_text_style.dart';
import 'package:refill_app/presentation/finish/control_button.dart';
import 'package:refill_app/presentation/home/home_screen.dart';

class FinishScreen extends ConsumerWidget {
  const FinishScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = AudioPlayer();

    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 64.0,
                ),
                Center(
                  child: SvgPicture.asset(
                    'assets/icon/ic_check.svg',
                    colorFilter: const ColorFilter.mode(
                      RefillThemeColor.sub90,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  textAlign: TextAlign.center,
                  '만의 맞춤형 AI\n늘봄이가 만들어 졌어요!',
                  style: RefillThemeTextStyle.title4.copyWith(
                    color: RefillThemeColor.gray70,
                  ),
                ),
                ControlButtons(player),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: YellowButton(
                    enabled: true,
                    text: '계속하기',
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
