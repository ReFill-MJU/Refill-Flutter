// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_child_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyChildListModel _$MyChildListModelFromJson(Map<String, dynamic> json) {
  return _MyChildListModel.fromJson(json);
}

/// @nodoc
mixin _$MyChildListModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this MyChildListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyChildListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyChildListModelCopyWith<MyChildListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyChildListModelCopyWith<$Res> {
  factory $MyChildListModelCopyWith(
          MyChildListModel value, $Res Function(MyChildListModel) then) =
      _$MyChildListModelCopyWithImpl<$Res, MyChildListModel>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$MyChildListModelCopyWithImpl<$Res, $Val extends MyChildListModel>
    implements $MyChildListModelCopyWith<$Res> {
  _$MyChildListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyChildListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyChildListModelImplCopyWith<$Res>
    implements $MyChildListModelCopyWith<$Res> {
  factory _$$MyChildListModelImplCopyWith(_$MyChildListModelImpl value,
          $Res Function(_$MyChildListModelImpl) then) =
      __$$MyChildListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$MyChildListModelImplCopyWithImpl<$Res>
    extends _$MyChildListModelCopyWithImpl<$Res, _$MyChildListModelImpl>
    implements _$$MyChildListModelImplCopyWith<$Res> {
  __$$MyChildListModelImplCopyWithImpl(_$MyChildListModelImpl _value,
      $Res Function(_$MyChildListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyChildListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$MyChildListModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyChildListModelImpl implements _MyChildListModel {
  const _$MyChildListModelImpl({required this.id, required this.name});

  factory _$MyChildListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyChildListModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'MyChildListModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyChildListModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of MyChildListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyChildListModelImplCopyWith<_$MyChildListModelImpl> get copyWith =>
      __$$MyChildListModelImplCopyWithImpl<_$MyChildListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyChildListModelImplToJson(
      this,
    );
  }
}

abstract class _MyChildListModel implements MyChildListModel {
  const factory _MyChildListModel(
      {required final int id,
      required final String name}) = _$MyChildListModelImpl;

  factory _MyChildListModel.fromJson(Map<String, dynamic> json) =
      _$MyChildListModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of MyChildListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyChildListModelImplCopyWith<_$MyChildListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
