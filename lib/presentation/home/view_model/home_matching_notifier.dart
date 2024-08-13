import 'package:refill_app/data/model/home_matching_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_matching_notifier.g.dart';

@riverpod
class HomeMatchingNotifier extends _$HomeMatchingNotifier {
  @override
  Future<HomeMatchingModel> build() async {
    return HomeMatchingModel(field: '', fieldEmpty: false);
  }

  void updateText(String field) {
    state = AsyncData(
      HomeMatchingModel(
        field: field,
        fieldEmpty: state.value!.field!.isEmpty,
      ),
    );
  }
}
