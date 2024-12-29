// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refer_code_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReferCodeModel _$ReferCodeModelFromJson(Map<String, dynamic> json) {
  return _ReferCodeModel.fromJson(json);
}

/// @nodoc
mixin _$ReferCodeModel {
  @JsonKey(name: 'status')
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  ReferCodeData? get referCodeData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferCodeModelCopyWith<ReferCodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferCodeModelCopyWith<$Res> {
  factory $ReferCodeModelCopyWith(
          ReferCodeModel value, $Res Function(ReferCodeModel) then) =
      _$ReferCodeModelCopyWithImpl<$Res, ReferCodeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') ReferCodeData? referCodeData});

  $ReferCodeDataCopyWith<$Res>? get referCodeData;
}

/// @nodoc
class _$ReferCodeModelCopyWithImpl<$Res, $Val extends ReferCodeModel>
    implements $ReferCodeModelCopyWith<$Res> {
  _$ReferCodeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? referCodeData = freezed,
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
      referCodeData: freezed == referCodeData
          ? _value.referCodeData
          : referCodeData // ignore: cast_nullable_to_non_nullable
              as ReferCodeData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferCodeDataCopyWith<$Res>? get referCodeData {
    if (_value.referCodeData == null) {
      return null;
    }

    return $ReferCodeDataCopyWith<$Res>(_value.referCodeData!, (value) {
      return _then(_value.copyWith(referCodeData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReferCodeModelImplCopyWith<$Res>
    implements $ReferCodeModelCopyWith<$Res> {
  factory _$$ReferCodeModelImplCopyWith(_$ReferCodeModelImpl value,
          $Res Function(_$ReferCodeModelImpl) then) =
      __$$ReferCodeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') ReferCodeData? referCodeData});

  @override
  $ReferCodeDataCopyWith<$Res>? get referCodeData;
}

/// @nodoc
class __$$ReferCodeModelImplCopyWithImpl<$Res>
    extends _$ReferCodeModelCopyWithImpl<$Res, _$ReferCodeModelImpl>
    implements _$$ReferCodeModelImplCopyWith<$Res> {
  __$$ReferCodeModelImplCopyWithImpl(
      _$ReferCodeModelImpl _value, $Res Function(_$ReferCodeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? referCodeData = freezed,
  }) {
    return _then(_$ReferCodeModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      referCodeData: freezed == referCodeData
          ? _value.referCodeData
          : referCodeData // ignore: cast_nullable_to_non_nullable
              as ReferCodeData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferCodeModelImpl implements _ReferCodeModel {
  _$ReferCodeModelImpl(
      {@JsonKey(name: 'status') this.status = false,
      @JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'data') this.referCodeData});

  factory _$ReferCodeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferCodeModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool status;
  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'data')
  final ReferCodeData? referCodeData;

  @override
  String toString() {
    return 'ReferCodeModel(status: $status, message: $message, referCodeData: $referCodeData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferCodeModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.referCodeData, referCodeData) ||
                other.referCodeData == referCodeData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, referCodeData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferCodeModelImplCopyWith<_$ReferCodeModelImpl> get copyWith =>
      __$$ReferCodeModelImplCopyWithImpl<_$ReferCodeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferCodeModelImplToJson(
      this,
    );
  }
}

abstract class _ReferCodeModel implements ReferCodeModel {
  factory _ReferCodeModel(
          {@JsonKey(name: 'status') final bool status,
          @JsonKey(name: 'message') final String message,
          @JsonKey(name: 'data') final ReferCodeData? referCodeData}) =
      _$ReferCodeModelImpl;

  factory _ReferCodeModel.fromJson(Map<String, dynamic> json) =
      _$ReferCodeModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool get status;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'data')
  ReferCodeData? get referCodeData;
  @override
  @JsonKey(ignore: true)
  _$$ReferCodeModelImplCopyWith<_$ReferCodeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReferCodeData _$ReferCodeDataFromJson(Map<String, dynamic> json) {
  return _ReferCodeData.fromJson(json);
}

/// @nodoc
mixin _$ReferCodeData {
  @JsonKey(name: 'refer_code')
  String get referCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferCodeDataCopyWith<ReferCodeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferCodeDataCopyWith<$Res> {
  factory $ReferCodeDataCopyWith(
          ReferCodeData value, $Res Function(ReferCodeData) then) =
      _$ReferCodeDataCopyWithImpl<$Res, ReferCodeData>;
  @useResult
  $Res call({@JsonKey(name: 'refer_code') String referCode});
}

/// @nodoc
class _$ReferCodeDataCopyWithImpl<$Res, $Val extends ReferCodeData>
    implements $ReferCodeDataCopyWith<$Res> {
  _$ReferCodeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referCode = null,
  }) {
    return _then(_value.copyWith(
      referCode: null == referCode
          ? _value.referCode
          : referCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferCodeDataImplCopyWith<$Res>
    implements $ReferCodeDataCopyWith<$Res> {
  factory _$$ReferCodeDataImplCopyWith(
          _$ReferCodeDataImpl value, $Res Function(_$ReferCodeDataImpl) then) =
      __$$ReferCodeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'refer_code') String referCode});
}

/// @nodoc
class __$$ReferCodeDataImplCopyWithImpl<$Res>
    extends _$ReferCodeDataCopyWithImpl<$Res, _$ReferCodeDataImpl>
    implements _$$ReferCodeDataImplCopyWith<$Res> {
  __$$ReferCodeDataImplCopyWithImpl(
      _$ReferCodeDataImpl _value, $Res Function(_$ReferCodeDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referCode = null,
  }) {
    return _then(_$ReferCodeDataImpl(
      referCode: null == referCode
          ? _value.referCode
          : referCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferCodeDataImpl implements _ReferCodeData {
  _$ReferCodeDataImpl({@JsonKey(name: 'refer_code') this.referCode = ''});

  factory _$ReferCodeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferCodeDataImplFromJson(json);

  @override
  @JsonKey(name: 'refer_code')
  final String referCode;

  @override
  String toString() {
    return 'ReferCodeData(referCode: $referCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferCodeDataImpl &&
            (identical(other.referCode, referCode) ||
                other.referCode == referCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, referCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferCodeDataImplCopyWith<_$ReferCodeDataImpl> get copyWith =>
      __$$ReferCodeDataImplCopyWithImpl<_$ReferCodeDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferCodeDataImplToJson(
      this,
    );
  }
}

abstract class _ReferCodeData implements ReferCodeData {
  factory _ReferCodeData(
          {@JsonKey(name: 'refer_code') final String referCode}) =
      _$ReferCodeDataImpl;

  factory _ReferCodeData.fromJson(Map<String, dynamic> json) =
      _$ReferCodeDataImpl.fromJson;

  @override
  @JsonKey(name: 'refer_code')
  String get referCode;
  @override
  @JsonKey(ignore: true)
  _$$ReferCodeDataImplCopyWith<_$ReferCodeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
