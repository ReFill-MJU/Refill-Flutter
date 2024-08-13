import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_child_list_model.freezed.dart';
part 'my_child_list_model.g.dart';

@freezed
class MyChildListModel with _$MyChildListModel {
  const factory MyChildListModel({
    required int id,
    required String name,
  }) = _MyChildListModel;

  factory MyChildListModel.fromJson(Map<String, dynamic> json) =>
      _$MyChildListModelFromJson(json);
}
