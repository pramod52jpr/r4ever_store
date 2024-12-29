// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GlobalDataModel _$GlobalDataModelFromJson(Map<String, dynamic> json) {
  return _GlobalDataModel.fromJson(json);
}

/// @nodoc
mixin _$GlobalDataModel {
  @JsonKey(name: 'status')
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  GlobalData? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GlobalDataModelCopyWith<GlobalDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalDataModelCopyWith<$Res> {
  factory $GlobalDataModelCopyWith(
          GlobalDataModel value, $Res Function(GlobalDataModel) then) =
      _$GlobalDataModelCopyWithImpl<$Res, GlobalDataModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') GlobalData? data});

  $GlobalDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$GlobalDataModelCopyWithImpl<$Res, $Val extends GlobalDataModel>
    implements $GlobalDataModelCopyWith<$Res> {
  _$GlobalDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
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
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GlobalData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GlobalDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $GlobalDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GlobalDataModelImplCopyWith<$Res>
    implements $GlobalDataModelCopyWith<$Res> {
  factory _$$GlobalDataModelImplCopyWith(_$GlobalDataModelImpl value,
          $Res Function(_$GlobalDataModelImpl) then) =
      __$$GlobalDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') GlobalData? data});

  @override
  $GlobalDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$GlobalDataModelImplCopyWithImpl<$Res>
    extends _$GlobalDataModelCopyWithImpl<$Res, _$GlobalDataModelImpl>
    implements _$$GlobalDataModelImplCopyWith<$Res> {
  __$$GlobalDataModelImplCopyWithImpl(
      _$GlobalDataModelImpl _value, $Res Function(_$GlobalDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$GlobalDataModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GlobalData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GlobalDataModelImpl implements _GlobalDataModel {
  _$GlobalDataModelImpl(
      {@JsonKey(name: 'status') this.status = false,
      @JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'data') this.data});

  factory _$GlobalDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GlobalDataModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool status;
  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'data')
  final GlobalData? data;

  @override
  String toString() {
    return 'GlobalDataModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalDataModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalDataModelImplCopyWith<_$GlobalDataModelImpl> get copyWith =>
      __$$GlobalDataModelImplCopyWithImpl<_$GlobalDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GlobalDataModelImplToJson(
      this,
    );
  }
}

abstract class _GlobalDataModel implements GlobalDataModel {
  factory _GlobalDataModel(
      {@JsonKey(name: 'status') final bool status,
      @JsonKey(name: 'message') final String message,
      @JsonKey(name: 'data') final GlobalData? data}) = _$GlobalDataModelImpl;

  factory _GlobalDataModel.fromJson(Map<String, dynamic> json) =
      _$GlobalDataModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool get status;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'data')
  GlobalData? get data;
  @override
  @JsonKey(ignore: true)
  _$$GlobalDataModelImplCopyWith<_$GlobalDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GlobalData _$GlobalDataFromJson(Map<String, dynamic> json) {
  return _GlobalData.fromJson(json);
}

/// @nodoc
mixin _$GlobalData {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'qrCode')
  String get qrCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'silverLock')
  bool get silverLock => throw _privateConstructorUsedError;
  @JsonKey(name: 'goldLock')
  bool get goldLock => throw _privateConstructorUsedError;
  @JsonKey(name: 'platinumLock')
  bool get platinumLock => throw _privateConstructorUsedError;
  @JsonKey(name: 'diamondLock')
  bool get diamondLock => throw _privateConstructorUsedError;
  @JsonKey(name: 'termsConditions')
  String get termsConditions => throw _privateConstructorUsedError;
  @JsonKey(name: 'impMsg')
  String get impMsg => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GlobalDataCopyWith<GlobalData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalDataCopyWith<$Res> {
  factory $GlobalDataCopyWith(
          GlobalData value, $Res Function(GlobalData) then) =
      _$GlobalDataCopyWithImpl<$Res, GlobalData>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'qrCode') String qrCode,
      @JsonKey(name: 'silverLock') bool silverLock,
      @JsonKey(name: 'goldLock') bool goldLock,
      @JsonKey(name: 'platinumLock') bool platinumLock,
      @JsonKey(name: 'diamondLock') bool diamondLock,
      @JsonKey(name: 'termsConditions') String termsConditions,
      @JsonKey(name: 'impMsg') String impMsg,
      @JsonKey(name: 'createdAt') String createdAt});
}

/// @nodoc
class _$GlobalDataCopyWithImpl<$Res, $Val extends GlobalData>
    implements $GlobalDataCopyWith<$Res> {
  _$GlobalDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? qrCode = null,
    Object? silverLock = null,
    Object? goldLock = null,
    Object? platinumLock = null,
    Object? diamondLock = null,
    Object? termsConditions = null,
    Object? impMsg = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      silverLock: null == silverLock
          ? _value.silverLock
          : silverLock // ignore: cast_nullable_to_non_nullable
              as bool,
      goldLock: null == goldLock
          ? _value.goldLock
          : goldLock // ignore: cast_nullable_to_non_nullable
              as bool,
      platinumLock: null == platinumLock
          ? _value.platinumLock
          : platinumLock // ignore: cast_nullable_to_non_nullable
              as bool,
      diamondLock: null == diamondLock
          ? _value.diamondLock
          : diamondLock // ignore: cast_nullable_to_non_nullable
              as bool,
      termsConditions: null == termsConditions
          ? _value.termsConditions
          : termsConditions // ignore: cast_nullable_to_non_nullable
              as String,
      impMsg: null == impMsg
          ? _value.impMsg
          : impMsg // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GlobalDataImplCopyWith<$Res>
    implements $GlobalDataCopyWith<$Res> {
  factory _$$GlobalDataImplCopyWith(
          _$GlobalDataImpl value, $Res Function(_$GlobalDataImpl) then) =
      __$$GlobalDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'qrCode') String qrCode,
      @JsonKey(name: 'silverLock') bool silverLock,
      @JsonKey(name: 'goldLock') bool goldLock,
      @JsonKey(name: 'platinumLock') bool platinumLock,
      @JsonKey(name: 'diamondLock') bool diamondLock,
      @JsonKey(name: 'termsConditions') String termsConditions,
      @JsonKey(name: 'impMsg') String impMsg,
      @JsonKey(name: 'createdAt') String createdAt});
}

/// @nodoc
class __$$GlobalDataImplCopyWithImpl<$Res>
    extends _$GlobalDataCopyWithImpl<$Res, _$GlobalDataImpl>
    implements _$$GlobalDataImplCopyWith<$Res> {
  __$$GlobalDataImplCopyWithImpl(
      _$GlobalDataImpl _value, $Res Function(_$GlobalDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? qrCode = null,
    Object? silverLock = null,
    Object? goldLock = null,
    Object? platinumLock = null,
    Object? diamondLock = null,
    Object? termsConditions = null,
    Object? impMsg = null,
    Object? createdAt = null,
  }) {
    return _then(_$GlobalDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      silverLock: null == silverLock
          ? _value.silverLock
          : silverLock // ignore: cast_nullable_to_non_nullable
              as bool,
      goldLock: null == goldLock
          ? _value.goldLock
          : goldLock // ignore: cast_nullable_to_non_nullable
              as bool,
      platinumLock: null == platinumLock
          ? _value.platinumLock
          : platinumLock // ignore: cast_nullable_to_non_nullable
              as bool,
      diamondLock: null == diamondLock
          ? _value.diamondLock
          : diamondLock // ignore: cast_nullable_to_non_nullable
              as bool,
      termsConditions: null == termsConditions
          ? _value.termsConditions
          : termsConditions // ignore: cast_nullable_to_non_nullable
              as String,
      impMsg: null == impMsg
          ? _value.impMsg
          : impMsg // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GlobalDataImpl implements _GlobalData {
  _$GlobalDataImpl(
      {@JsonKey(name: '_id') this.id = '',
      @JsonKey(name: 'qrCode') this.qrCode = '',
      @JsonKey(name: 'silverLock') this.silverLock = false,
      @JsonKey(name: 'goldLock') this.goldLock = false,
      @JsonKey(name: 'platinumLock') this.platinumLock = false,
      @JsonKey(name: 'diamondLock') this.diamondLock = false,
      @JsonKey(name: 'termsConditions') this.termsConditions = '',
      @JsonKey(name: 'impMsg') this.impMsg = '',
      @JsonKey(name: 'createdAt') this.createdAt = ''});

  factory _$GlobalDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GlobalDataImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'qrCode')
  final String qrCode;
  @override
  @JsonKey(name: 'silverLock')
  final bool silverLock;
  @override
  @JsonKey(name: 'goldLock')
  final bool goldLock;
  @override
  @JsonKey(name: 'platinumLock')
  final bool platinumLock;
  @override
  @JsonKey(name: 'diamondLock')
  final bool diamondLock;
  @override
  @JsonKey(name: 'termsConditions')
  final String termsConditions;
  @override
  @JsonKey(name: 'impMsg')
  final String impMsg;
  @override
  @JsonKey(name: 'createdAt')
  final String createdAt;

  @override
  String toString() {
    return 'GlobalData(id: $id, qrCode: $qrCode, silverLock: $silverLock, goldLock: $goldLock, platinumLock: $platinumLock, diamondLock: $diamondLock, termsConditions: $termsConditions, impMsg: $impMsg, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.silverLock, silverLock) ||
                other.silverLock == silverLock) &&
            (identical(other.goldLock, goldLock) ||
                other.goldLock == goldLock) &&
            (identical(other.platinumLock, platinumLock) ||
                other.platinumLock == platinumLock) &&
            (identical(other.diamondLock, diamondLock) ||
                other.diamondLock == diamondLock) &&
            (identical(other.termsConditions, termsConditions) ||
                other.termsConditions == termsConditions) &&
            (identical(other.impMsg, impMsg) || other.impMsg == impMsg) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, qrCode, silverLock, goldLock,
      platinumLock, diamondLock, termsConditions, impMsg, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalDataImplCopyWith<_$GlobalDataImpl> get copyWith =>
      __$$GlobalDataImplCopyWithImpl<_$GlobalDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GlobalDataImplToJson(
      this,
    );
  }
}

abstract class _GlobalData implements GlobalData {
  factory _GlobalData(
      {@JsonKey(name: '_id') final String id,
      @JsonKey(name: 'qrCode') final String qrCode,
      @JsonKey(name: 'silverLock') final bool silverLock,
      @JsonKey(name: 'goldLock') final bool goldLock,
      @JsonKey(name: 'platinumLock') final bool platinumLock,
      @JsonKey(name: 'diamondLock') final bool diamondLock,
      @JsonKey(name: 'termsConditions') final String termsConditions,
      @JsonKey(name: 'impMsg') final String impMsg,
      @JsonKey(name: 'createdAt') final String createdAt}) = _$GlobalDataImpl;

  factory _GlobalData.fromJson(Map<String, dynamic> json) =
      _$GlobalDataImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'qrCode')
  String get qrCode;
  @override
  @JsonKey(name: 'silverLock')
  bool get silverLock;
  @override
  @JsonKey(name: 'goldLock')
  bool get goldLock;
  @override
  @JsonKey(name: 'platinumLock')
  bool get platinumLock;
  @override
  @JsonKey(name: 'diamondLock')
  bool get diamondLock;
  @override
  @JsonKey(name: 'termsConditions')
  String get termsConditions;
  @override
  @JsonKey(name: 'impMsg')
  String get impMsg;
  @override
  @JsonKey(name: 'createdAt')
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$GlobalDataImplCopyWith<_$GlobalDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
