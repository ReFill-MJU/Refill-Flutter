import 'dart:convert';

import 'package:refill_app/data/repository/child_repository.dart';
import 'package:refill_app/presentation/home/view_model/my_child_list_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/model/child_detail_model.dart';

part 'my_child_detail_notifier.g.dart';

@riverpod
Future<ChildDetailModel> myChildDetailModel(
    MyChildDetailModelRef ref, int? childId) async {
  if (childId == null) {
    final childList = await ref.watch(myChildListModelProvider.future);
    childId = childList.first.id;
  }

  final response = await ChildRepository.myChildDetail(childId);
  final json = jsonDecode(response) as Map<String, dynamic>;
  final data = json['child'] as Map<String, dynamic>;

  return ChildDetailModel.fromJson(data);
}
