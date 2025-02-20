// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActionStatusModel _$ActionStatusModelFromJson(Map<String, dynamic> json) {
  return _ActionStatusModel.fromJson(json);
}

/// @nodoc
mixin _$ActionStatusModel {
  @JsonKey(name: 'status')
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActionStatusModelCopyWith<ActionStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionStatusModelCopyWith<$Res> {
  factory $ActionStatusModelCopyWith(
          ActionStatusModel value, $Res Function(ActionStatusModel) then) =
      _$ActionStatusModelCopyWithImpl<$Res, ActionStatusModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'url') String url});
}

/// @nodoc
class _$ActionStatusModelCopyWithImpl<$Res, $Val extends ActionStatusModel>
    implements $ActionStatusModelCopyWith<$Res> {
  _$ActionStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? url = null,
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
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActionStatusModelImplCopyWith<$Res>
    implements $ActionStatusModelCopyWith<$Res> {
  factory _$$ActionStatusModelImplCopyWith(_$ActionStatusModelImpl value,
          $Res Function(_$ActionStatusModelImpl) then) =
      __$$ActionStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'url') String url});
}

/// @nodoc
class __$$ActionStatusModelImplCopyWithImpl<$Res>
    extends _$ActionStatusModelCopyWithImpl<$Res, _$ActionStatusModelImpl>
    implements _$$ActionStatusModelImplCopyWith<$Res> {
  __$$ActionStatusModelImplCopyWithImpl(_$ActionStatusModelImpl _value,
      $Res Function(_$ActionStatusModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? url = null,
  }) {
    return _then(_$ActionStatusModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActionStatusModelImpl implements _ActionStatusModel {
  _$ActionStatusModelImpl(
      {@JsonKey(name: 'status') this.status = false,
      @JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'url') this.url = ''});

  factory _$ActionStatusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActionStatusModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool status;
  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'url')
  final String url;

  @override
  String toString() {
    return 'ActionStatusModel(status: $status, message: $message, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionStatusModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionStatusModelImplCopyWith<_$ActionStatusModelImpl> get copyWith =>
      __$$ActionStatusModelImplCopyWithImpl<_$ActionStatusModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActionStatusModelImplToJson(
      this,
    );
  }
}

abstract class _ActionStatusModel implements ActionStatusModel {
  factory _ActionStatusModel(
      {@JsonKey(name: 'status') final bool status,
      @JsonKey(name: 'message') final String message,
      @JsonKey(name: 'url') final String url}) = _$ActionStatusModelImpl;

  factory _ActionStatusModel.fromJson(Map<String, dynamic> json) =
      _$ActionStatusModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool get status;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'url')
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$ActionStatusModelImplCopyWith<_$ActionStatusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
