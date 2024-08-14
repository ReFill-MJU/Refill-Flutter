import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:refill_app/core/component/round_24_container.dart';
import 'package:refill_app/data/model/child_detail_model.dart';
import 'package:refill_app/presentation/home/view/summary_bottom.dart';
import 'package:refill_app/presentation/home/view_model/my_child_detail_notifier.dart';
import 'package:refill_app/presentation/home/view_model/seleceted_provider.dart';

import '../../../core/button/round_button.dart';
import '../../../core/component/basic_picture_fix.dart';
import '../../../core/theme/refill_theme_color.dart';
import '../../../core/theme/refill_theme_text_style.dart';

void showDiaryCommentBottomSheet(
  BuildContext context,
) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: RefillThemeColor.realWhite,
    builder: (BuildContext context) {
      return const SummaryBottom();
    },
  );
}

class BabyInfo extends ConsumerWidget {
  const BabyInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ChildDetailModel> childInfo = ref
        .watch(myChildDetailModelProvider(ref.watch(selectedChildIdProvider)));

    return childInfo.when(
      data: (child) {
        return Round24Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const BasicPictureFix(size: 93),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/icon/ic_boy.svg'),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                child.name,
                                style: RefillThemeTextStyle.head1.copyWith(
                                  color: RefillThemeColor.primary50,
                                ),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                child.ageKorean,
                                style: RefillThemeTextStyle.button3.copyWith(
                                  color: RefillThemeColor.sub90,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            child.comment,
                            style: RefillThemeTextStyle.body6
                                .copyWith(color: RefillThemeColor.gray80),
                          ),
                          const SizedBox(height: 2.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    child.birth,
                                    style: RefillThemeTextStyle.body6.copyWith(
                                      color: RefillThemeColor.gray70,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'D+${child.dBirth}',
                                    style: RefillThemeTextStyle.body2.copyWith(
                                        color: RefillThemeColor.sub90),
                                  ),
                                  RoundButton(
                                    onPress: () {
                                      showDiaryCommentBottomSheet(context);
                                    },
                                    buttonChild: SvgPicture.asset(
                                      'assets/icon/ic_share.svg',
                                      colorFilter: const ColorFilter.mode(
                                          RefillThemeColor.primary50,
                                          BlendMode.srcIn),
                                    ),
                                    style: IconButton.styleFrom(
                                      backgroundColor: RefillThemeColor.sub10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
