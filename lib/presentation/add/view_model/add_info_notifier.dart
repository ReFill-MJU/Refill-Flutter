import 'package:refill_app/data/model/add_info_model.dart';
import 'package:refill_app/data/repository/child_repository.dart';
import 'package:refill_app/presentation/home/view_model/my_child_list_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_info_notifier.g.dart';

@riverpod
class AddInfoNotifier extends _$AddInfoNotifier {
  @override
  Future<AddInfoModel> build() async {
    return AddInfoModel(
      name: '',
      isBoy: false,
      isGirl: false,
      birth: '',
      isComplete: false,
    );
  }

  void updateName(String name) {
    state = AsyncData(
      AddInfoModel(
        name: name,
        isBoy: state.value!.isBoy,
        isGirl: state.value!.isGirl,
        birth: state.value!.birth,
        isComplete: state.value!.isComplete,
      ),
    );
    _updateAddInfoStatus();
  }

  void updateIsBoy() {
    state = AsyncData(
      AddInfoModel(
        name: state.value!.name,
        isBoy: true,
        isGirl: false,
        birth: state.value!.birth,
        isComplete: state.value!.isComplete,
      ),
    );
    _updateAddInfoStatus();
  }

  void updateIsGirl() {
    state = AsyncData(
      AddInfoModel(
        name: state.value!.name,
        isBoy: false,
        isGirl: true,
        birth: state.value!.birth,
        isComplete: state.value!.isComplete,
      ),
    );
    _updateAddInfoStatus();
  }

  void updateDateFormatted(DateTime date) {
    final formattedDate =
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    updateBirth(formattedDate);
  }

  void updateBirth(String birth) {
    state = AsyncData(
      AddInfoModel(
        name: state.value!.name,
        isBoy: state.value!.isBoy,
        isGirl: state.value!.isGirl,
        birth: birth,
        isComplete: state.value!.isComplete,
      ),
    );
    _updateAddInfoStatus();
  }

  void _updateAddInfoStatus() {
    if (state.value != null) {
      state = AsyncData(
        AddInfoModel(
          name: state.value!.name,
          isBoy: state.value!.isBoy,
          isGirl: state.value!.isGirl,
          birth: state.value!.birth,
          isComplete:
              state.value!.name.isNotEmpty && state.value!.birth.isNotEmpty,
        ),
      );
    }
  }

  Future<void> childAdd() async {
    String gender = '';
    if (state.value!.isBoy) {
      gender = 'BOY';
    }
    if (state.value!.isGirl) {
      gender = 'GIRL';
    }

    await ChildRepository.childAdd(
      state.value!.name,
      gender,
      state.value!.birth,
    );
    ref.invalidate(myChildListModelProvider);
  }
}
