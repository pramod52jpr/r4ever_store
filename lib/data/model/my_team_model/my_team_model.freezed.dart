// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_team_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyTeamModel _$MyTeamModelFromJson(Map<String, dynamic> json) {
  return _MyTeamModelModel.fromJson(json);
}

/// @nodoc
mixin _$MyTeamModel {
  @JsonKey(name: 'status')
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<UserModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyTeamModelCopyWith<MyTeamModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyTeamModelCopyWith<$Res> {
  factory $MyTeamModelCopyWith(
          MyTeamModel value, $Res Function(MyTeamModel) then) =
      _$MyTeamModelCopyWithImpl<$Res, MyTeamModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') List<UserModel> data});
}

/// @nodoc
class _$MyTeamModelCopyWithImpl<$Res, $Val extends MyTeamModel>
    implements $MyTeamModelCopyWith<$Res> {
  _$MyTeamModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyTeamModelModelImplCopyWith<$Res>
    implements $MyTeamModelCopyWith<$Res> {
  factory _$$MyTeamModelModelImplCopyWith(_$MyTeamModelModelImpl value,
          $Res Function(_$MyTeamModelModelImpl) then) =
      __$$MyTeamModelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') List<UserModel> data});
}

/// @nodoc
class __$$MyTeamModelModelImplCopyWithImpl<$Res>
    extends _$MyTeamModelCopyWithImpl<$Res, _$MyTeamModelModelImpl>
    implements _$$MyTeamModelModelImplCopyWith<$Res> {
  __$$MyTeamModelModelImplCopyWithImpl(_$MyTeamModelModelImpl _value,
      $Res Function(_$MyTeamModelModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$MyTeamModelModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyTeamModelModelImpl implements _MyTeamModelModel {
  _$MyTeamModelModelImpl(
      {@JsonKey(name: 'status') this.status = false,
      @JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'data') final List<UserModel> data = const []})
      : _data = data;

  factory _$MyTeamModelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyTeamModelModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool status;
  @override
  @JsonKey(name: 'message')
  final String message;
  final List<UserModel> _data;
  @override
  @JsonKey(name: 'data')
  List<UserModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'MyTeamModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyTeamModelModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyTeamModelModelImplCopyWith<_$MyTeamModelModelImpl> get copyWith =>
      __$$MyTeamModelModelImplCopyWithImpl<_$MyTeamModelModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyTeamModelModelImplToJson(
      this,
    );
  }
}

abstract class _MyTeamModelModel implements MyTeamModel {
  factory _MyTeamModelModel(
          {@JsonKey(name: 'status') final bool status,
          @JsonKey(name: 'message') final String message,
          @JsonKey(name: 'data') final List<UserModel> data}) =
      _$MyTeamModelModelImpl;

  factory _MyTeamModelModel.fromJson(Map<String, dynamic> json) =
      _$MyTeamModelModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool get status;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'data')
  List<UserModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$MyTeamModelModelImplCopyWith<_$MyTeamModelModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
