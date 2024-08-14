import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repository/child_repository.dart';
import 'my_child_list_notifier.dart';

part 'ai_message_notifier.g.dart';

@riverpod
class AiMessageNotifier extends _$AiMessageNotifier {
  List<String> messages = [];

  @override
  Future<List<String>> build() async {
    return messages;
  }

  Future<void> postMessage(int? childId, String message) async {
    if (childId == null) {
      final childList = await ref.watch(myChildListModelProvider.future);
      childId = childList.first.id;
    }
    messages.insert(0, message);
    await ChildRepository.childcareTest(childId, message);
  }
}
