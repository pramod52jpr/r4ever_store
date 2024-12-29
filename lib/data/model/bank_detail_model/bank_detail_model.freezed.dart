// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BankDetailModel _$BankDetailModelFromJson(Map<String, dynamic> json) {
  return _BankDetailModel.fromJson(json);
}

/// @nodoc
mixin _$BankDetailModel {
  @JsonKey(name: 'status')
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  BankDetail? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankDetailModelCopyWith<BankDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankDetailModelCopyWith<$Res> {
  factory $BankDetailModelCopyWith(
          BankDetailModel value, $Res Function(BankDetailModel) then) =
      _$BankDetailModelCopyWithImpl<$Res, BankDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') BankDetail? data});

  $BankDetailCopyWith<$Res>? get data;
}

/// @nodoc
class _$BankDetailModelCopyWithImpl<$Res, $Val extends BankDetailModel>
    implements $BankDetailModelCopyWith<$Res> {
  _$BankDetailModelCopyWithImpl(this._value, this._then);

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
              as BankDetail?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BankDetailCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $BankDetailCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BankDetailModelImplCopyWith<$Res>
    implements $BankDetailModelCopyWith<$Res> {
  factory _$$BankDetailModelImplCopyWith(_$BankDetailModelImpl value,
          $Res Function(_$BankDetailModelImpl) then) =
      __$$BankDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') BankDetail? data});

  @override
  $BankDetailCopyWith<$Res>? get data;
}

/// @nodoc
class __$$BankDetailModelImplCopyWithImpl<$Res>
    extends _$BankDetailModelCopyWithImpl<$Res, _$BankDetailModelImpl>
    implements _$$BankDetailModelImplCopyWith<$Res> {
  __$$BankDetailModelImplCopyWithImpl(
      _$BankDetailModelImpl _value, $Res Function(_$BankDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$BankDetailModelImpl(
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
              as BankDetail?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BankDetailModelImpl implements _BankDetailModel {
  _$BankDetailModelImpl(
      {@JsonKey(name: 'status') this.status = false,
      @JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'data') this.data});

  factory _$BankDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankDetailModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool status;
  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'data')
  final BankDetail? data;

  @override
  String toString() {
    return 'BankDetailModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankDetailModelImpl &&
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
  _$$BankDetailModelImplCopyWith<_$BankDetailModelImpl> get copyWith =>
      __$$BankDetailModelImplCopyWithImpl<_$BankDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankDetailModelImplToJson(
      this,
    );
  }
}

abstract class _BankDetailModel implements BankDetailModel {
  factory _BankDetailModel(
      {@JsonKey(name: 'status') final bool status,
      @JsonKey(name: 'message') final String message,
      @JsonKey(name: 'data') final BankDetail? data}) = _$BankDetailModelImpl;

  factory _BankDetailModel.fromJson(Map<String, dynamic> json) =
      _$BankDetailModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool get status;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'data')
  BankDetail? get data;
  @override
  @JsonKey(ignore: true)
  _$$BankDetailModelImplCopyWith<_$BankDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BankDetail _$BankDetailFromJson(Map<String, dynamic> json) {
  return _BankDetail.fromJson(json);
}

/// @nodoc
mixin _$BankDetail {
  @JsonKey(name: 'accountNo')
  String get accountNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'bankName')
  String get bankName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ifscCode')
  String get ifscCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  UserModel? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankDetailCopyWith<BankDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankDetailCopyWith<$Res> {
  factory $BankDetailCopyWith(
          BankDetail value, $Res Function(BankDetail) then) =
      _$BankDetailCopyWithImpl<$Res, BankDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'accountNo') String accountNo,
      @JsonKey(name: 'bankName') String bankName,
      @JsonKey(name: 'ifscCode') String ifscCode,
      @JsonKey(name: 'userId') UserModel? userId});

  $UserModelCopyWith<$Res>? get userId;
}

/// @nodoc
class _$BankDetailCopyWithImpl<$Res, $Val extends BankDetail>
    implements $BankDetailCopyWith<$Res> {
  _$BankDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNo = null,
    Object? bankName = null,
    Object? ifscCode = null,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      accountNo: null == accountNo
          ? _value.accountNo
          : accountNo // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      ifscCode: null == ifscCode
          ? _value.ifscCode
          : ifscCode // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get userId {
    if (_value.userId == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.userId!, (value) {
      return _then(_value.copyWith(userId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BankDetailImplCopyWith<$Res>
    implements $BankDetailCopyWith<$Res> {
  factory _$$BankDetailImplCopyWith(
          _$BankDetailImpl value, $Res Function(_$BankDetailImpl) then) =
      __$$BankDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'accountNo') String accountNo,
      @JsonKey(name: 'bankName') String bankName,
      @JsonKey(name: 'ifscCode') String ifscCode,
      @JsonKey(name: 'userId') UserModel? userId});

  @override
  $UserModelCopyWith<$Res>? get userId;
}

/// @nodoc
class __$$BankDetailImplCopyWithImpl<$Res>
    extends _$BankDetailCopyWithImpl<$Res, _$BankDetailImpl>
    implements _$$BankDetailImplCopyWith<$Res> {
  __$$BankDetailImplCopyWithImpl(
      _$BankDetailImpl _value, $Res Function(_$BankDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNo = null,
    Object? bankName = null,
    Object? ifscCode = null,
    Object? userId = freezed,
  }) {
    return _then(_$BankDetailImpl(
      accountNo: null == accountNo
          ? _value.accountNo
          : accountNo // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      ifscCode: null == ifscCode
          ? _value.ifscCode
          : ifscCode // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BankDetailImpl implements _BankDetail {
  _$BankDetailImpl(
      {@JsonKey(name: 'accountNo') this.accountNo = '',
      @JsonKey(name: 'bankName') this.bankName = '',
      @JsonKey(name: 'ifscCode') this.ifscCode = '',
      @JsonKey(name: 'userId') this.userId});

  factory _$BankDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankDetailImplFromJson(json);

  @override
  @JsonKey(name: 'accountNo')
  final String accountNo;
  @override
  @JsonKey(name: 'bankName')
  final String bankName;
  @override
  @JsonKey(name: 'ifscCode')
  final String ifscCode;
  @override
  @JsonKey(name: 'userId')
  final UserModel? userId;

  @override
  String toString() {
    return 'BankDetail(accountNo: $accountNo, bankName: $bankName, ifscCode: $ifscCode, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankDetailImpl &&
            (identical(other.accountNo, accountNo) ||
                other.accountNo == accountNo) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.ifscCode, ifscCode) ||
                other.ifscCode == ifscCode) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accountNo, bankName, ifscCode, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankDetailImplCopyWith<_$BankDetailImpl> get copyWith =>
      __$$BankDetailImplCopyWithImpl<_$BankDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankDetailImplToJson(
      this,
    );
  }
}

abstract class _BankDetail implements BankDetail {
  factory _BankDetail(
      {@JsonKey(name: 'accountNo') final String accountNo,
      @JsonKey(name: 'bankName') final String bankName,
      @JsonKey(name: 'ifscCode') final String ifscCode,
      @JsonKey(name: 'userId') final UserModel? userId}) = _$BankDetailImpl;

  factory _BankDetail.fromJson(Map<String, dynamic> json) =
      _$BankDetailImpl.fromJson;

  @override
  @JsonKey(name: 'accountNo')
  String get accountNo;
  @override
  @JsonKey(name: 'bankName')
  String get bankName;
  @override
  @JsonKey(name: 'ifscCode')
  String get ifscCode;
  @override
  @JsonKey(name: 'userId')
  UserModel? get userId;
  @override
  @JsonKey(ignore: true)
  _$$BankDetailImplCopyWith<_$BankDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
