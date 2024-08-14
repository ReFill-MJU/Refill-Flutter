import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:refill_app/data/model/my_child_list_model.dart';
import 'package:refill_app/presentation/add/add_screen.dart';
import 'package:refill_app/presentation/home/view/baby_button.dart';
import 'package:refill_app/presentation/home/view_model/my_child_list_notifier.dart';
import 'package:refill_app/presentation/home/view_model/seleceted_provider.dart';

import '../../../core/button/round_button.dart';
import '../../../core/theme/refill_theme_color.dart';

class BabyList extends ConsumerWidget {
  const BabyList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<MyChildListModel>> childList =
        ref.watch(myChildListModelProvider);
    var selectedChildId = ref.watch(selectedChildIdProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RoundButton(
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => const AddScreen(),
                ),
              );
            },
            buttonChild: SvgPicture.asset(
              'assets/icon/ic_plus.svg',
            ),
            style: IconButton.styleFrom(
              backgroundColor: RefillThemeColor.sub90,
            ),
          ),
          const SizedBox(width: 8),
          childList.when(
            data: (children) {
              return Row(
                children: children.map((child) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: BabyButton(
                      enabled: selectedChildId == null
                          ? child.id == childList.value!.first.id
                          : child.id == selectedChildId,
                      text: child.name,
                      onPressed: () {
                        ref.read(selectedChildIdProvider.notifier).state =
                            child.id;
                      },
                      fontPadding: 0,
                      padding: 16.0,
                    ),
                  );
                }).toList(),
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Text('Error: $error'),
          ),
        ],
      ),
    );
  }
}
