import 'package:freezed_annotation/freezed_annotation.dart';

part 'child_detail_model.freezed.dart';
part 'child_detail_model.g.dart';

@freezed
class ChildDetailModel with _$ChildDetailModel {
  factory ChildDetailModel({
    required int id,
    required String name,
    required String ageKorean,
    required int age,
    required String gender,
    required String comment,
    required String birth,
    required int dBirth,
  }) = _ChildDetailModel;

  factory ChildDetailModel.fromJson(Map<String, dynamic> json) => _$ChildDetailModelFromJson(json);
}
