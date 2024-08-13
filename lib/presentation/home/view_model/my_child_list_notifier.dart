import 'dart:convert';

import 'package:refill_app/data/repository/child_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/model/my_child_list_model.dart';

part 'my_child_list_notifier.g.dart';

@riverpod
Future<List<MyChildListModel>> myChildListModel(MyChildListModelRef ref) async {
  final response = await ChildRepository.childcareList();
  final json = jsonDecode(response) as Map<String, dynamic>;
  final List<dynamic> data = json['data'] as List<dynamic>;
  return data.map((item) => MyChildListModel.fromJson(item)).toList();
}
