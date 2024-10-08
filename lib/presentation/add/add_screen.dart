import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refill_app/core/button/white_button.dart';
import 'package:refill_app/core/button/yellow_button.dart';
import 'package:refill_app/presentation/add/view/add_first.dart';
import 'package:refill_app/presentation/add/view/add_fourth.dart';
import 'package:refill_app/presentation/add/view/add_second.dart';
import 'package:refill_app/presentation/add/view/add_third.dart';
import 'package:refill_app/presentation/add/view_model/add_info_notifier.dart';
import 'package:refill_app/presentation/add/view_model/answer_notifier.dart';
import 'package:refill_app/presentation/add/view_model/move_notifier.dart';
import 'package:refill_app/presentation/finish/finish_screen.dart';

import '../../core/app_bar/back_left_title_app_bar.dart';

class AddScreen extends ConsumerWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var moveProvider = ref.watch(onBoardingMoveProvider);
    var move = ref.read(onBoardingMoveProvider.notifier);
    var addInfoNotifier = ref.read(addInfoNotifierProvider.notifier);
    var addInfo = ref.watch(addInfoNotifierProvider);
    var answerNotifier = ref.read(answerNotifierProvider.notifier);
    var answer = ref.watch(answerNotifierProvider);

    String currentIndex;
    bool enabled = false;

    switch (moveProvider) {
      case "first":
        currentIndex = "1";
        enabled = addInfo.value?.isComplete ?? false;
        break;
      case "second":
        currentIndex = "2";
        enabled = answer.value?.fieldNotEmpty ?? false;
        break;
      case "third":
        currentIndex = "3";
        enabled = answer.value?.fieldNotEmpty ?? false;
        false;
        break;
      case "fourth":
        currentIndex = "4";
        enabled = answer.value?.fieldNotEmpty ?? false;
        break;
      default:
        currentIndex = "0";
    }

    return Scaffold(
      appBar: BackLeftTitleAppBar(
        title: "아이 등록",
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text('$currentIndex/4'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Consumer(builder: (context, ref, _) {
                  switch (moveProvider) {
                    case "first":
                      return const AddFirst();
                    case "second":
                      return const AddSecond();
                    case "third":
                      return const AddThird();
                    case "fourth":
                      return const AddFourth();
                    default:
                      return Container();
                  }
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Visibility(
                      visible: moveProvider != 'first',
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: WhiteButton(
                            text: '이전',
                            onPressed: () {
                              switch (moveProvider) {
                                case "first":
                                  return;
                                case "second":
                                  move.moveToFirstPage();
                                case "third":
                                  move.moveToSecondPage();
                                case "fourth":
                                  move.moveToThirdPage();
                              }
                            },
                            enabled: true,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: YellowButton(
                          text: '다음',
                          onPressed: () {
                            switch (moveProvider) {
                              case "first":
                                move.moveToSecondPage();
                                ref
                                    .read(addInfoNotifierProvider.notifier)
                                    .childAdd();
                              case "second":
                                move.moveToThirdPage();
                                ref
                                    .read(answerNotifierProvider.notifier)
                                    .firstAnswer(1);
                                ref.invalidate(answerNotifierProvider);
                              case "third":
                                move.moveToFourthPage();
                                ref
                                    .read(answerNotifierProvider.notifier)
                                    .secondAnswer(1);
                                ref.invalidate(answerNotifierProvider);
                              case "fourth":
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const FinishScreen(),
                                  ),
                                  (route) => false,
                                );
                                ref.invalidate(answerNotifierProvider);
                            }
                          },
                          enabled: enabled,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
