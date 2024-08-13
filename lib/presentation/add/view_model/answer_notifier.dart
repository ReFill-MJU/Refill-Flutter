import 'package:refill_app/data/model/answer_model.dart';
import 'package:refill_app/data/repository/child_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'answer_notifier.g.dart';

@riverpod
class AnswerNotifier extends _$AnswerNotifier {
  @override
  Future<AnswerModel> build() async {
    return AnswerModel(fieldNotEmpty: false, field: '');
  }

  void updateText(String field) {
    state = AsyncData(
      AnswerModel(field: field, fieldNotEmpty: state.value!.field.isNotEmpty),
    );
  }

  Future<void> firstAnswer(int childId) async {
    await ChildRepository.answerAdd(childId, 1, state.value!.field);
  }

  Future<void> secondAnswer(int childId) async {
    await ChildRepository.answerAdd(childId, 2, state.value!.field);
  }

  Future<void> thirdAnswer(int childId) async {
    await ChildRepository.answerAdd(childId, 3, state.value!.field);
  }
}
