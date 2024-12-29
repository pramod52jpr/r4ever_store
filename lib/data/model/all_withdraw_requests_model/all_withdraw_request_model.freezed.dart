// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_withdraw_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllWithdrawRequestsModel _$AllWithdrawRequestsModelFromJson(
    Map<String, dynamic> json) {
  return _AllWithdrawRequestsModel.fromJson(json);
}

/// @nodoc
mixin _$AllWithdrawRequestsModel {
  @JsonKey(name: 'status')
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<WithdrawModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllWithdrawRequestsModelCopyWith<AllWithdrawRequestsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllWithdrawRequestsModelCopyWith<$Res> {
  factory $AllWithdrawRequestsModelCopyWith(AllWithdrawRequestsModel value,
          $Res Function(AllWithdrawRequestsModel) then) =
      _$AllWithdrawRequestsModelCopyWithImpl<$Res, AllWithdrawRequestsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') List<WithdrawModel> data});
}

/// @nodoc
class _$AllWithdrawRequestsModelCopyWithImpl<$Res,
        $Val extends AllWithdrawRequestsModel>
    implements $AllWithdrawRequestsModelCopyWith<$Res> {
  _$AllWithdrawRequestsModelCopyWithImpl(this._value, this._then);

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
              as List<WithdrawModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllWithdrawRequestsModelImplCopyWith<$Res>
    implements $AllWithdrawRequestsModelCopyWith<$Res> {
  factory _$$AllWithdrawRequestsModelImplCopyWith(
          _$AllWithdrawRequestsModelImpl value,
          $Res Function(_$AllWithdrawRequestsModelImpl) then) =
      __$$AllWithdrawRequestsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') List<WithdrawModel> data});
}

/// @nodoc
class __$$AllWithdrawRequestsModelImplCopyWithImpl<$Res>
    extends _$AllWithdrawRequestsModelCopyWithImpl<$Res,
        _$AllWithdrawRequestsModelImpl>
    implements _$$AllWithdrawRequestsModelImplCopyWith<$Res> {
  __$$AllWithdrawRequestsModelImplCopyWithImpl(
      _$AllWithdrawRequestsModelImpl _value,
      $Res Function(_$AllWithdrawRequestsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$AllWithdrawRequestsModelImpl(
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
              as List<WithdrawModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllWithdrawRequestsModelImpl implements _AllWithdrawRequestsModel {
  _$AllWithdrawRequestsModelImpl(
      {@JsonKey(name: 'status') this.status = false,
      @JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'data') final List<WithdrawModel> data = const []})
      : _data = data;

  factory _$AllWithdrawRequestsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllWithdrawRequestsModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool status;
  @override
  @JsonKey(name: 'message')
  final String message;
  final List<WithdrawModel> _data;
  @override
  @JsonKey(name: 'data')
  List<WithdrawModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'AllWithdrawRequestsModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllWithdrawRequestsModelImpl &&
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
  _$$AllWithdrawRequestsModelImplCopyWith<_$AllWithdrawRequestsModelImpl>
      get copyWith => __$$AllWithdrawRequestsModelImplCopyWithImpl<
          _$AllWithdrawRequestsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllWithdrawRequestsModelImplToJson(
      this,
    );
  }
}

abstract class _AllWithdrawRequestsModel implements AllWithdrawRequestsModel {
  factory _AllWithdrawRequestsModel(
          {@JsonKey(name: 'status') final bool status,
          @JsonKey(name: 'message') final String message,
          @JsonKey(name: 'data') final List<WithdrawModel> data}) =
      _$AllWithdrawRequestsModelImpl;

  factory _AllWithdrawRequestsModel.fromJson(Map<String, dynamic> json) =
      _$AllWithdrawRequestsModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool get status;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'data')
  List<WithdrawModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$AllWithdrawRequestsModelImplCopyWith<_$AllWithdrawRequestsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WithdrawModel _$WithdrawModelFromJson(Map<String, dynamic> json) {
  return _WithdrawModel.fromJson(json);
}

/// @nodoc
mixin _$WithdrawModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  UserModel? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'bankDetails')
  WithdrawBankDetail? get bankDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  int get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'success')
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WithdrawModelCopyWith<WithdrawModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WithdrawModelCopyWith<$Res> {
  factory $WithdrawModelCopyWith(
          WithdrawModel value, $Res Function(WithdrawModel) then) =
      _$WithdrawModelCopyWithImpl<$Res, WithdrawModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'userId') UserModel? userId,
      @JsonKey(name: 'bankDetails') WithdrawBankDetail? bankDetails,
      @JsonKey(name: 'amount') int amount,
      @JsonKey(name: 'success') bool success,
      @JsonKey(name: 'createdAt') String createdAt,
      @JsonKey(name: 'updatedAt') String updatedAt});

  $UserModelCopyWith<$Res>? get userId;
  $WithdrawBankDetailCopyWith<$Res>? get bankDetails;
}

/// @nodoc
class _$WithdrawModelCopyWithImpl<$Res, $Val extends WithdrawModel>
    implements $WithdrawModelCopyWith<$Res> {
  _$WithdrawModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? bankDetails = freezed,
    Object? amount = null,
    Object? success = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      bankDetails: freezed == bankDetails
          ? _value.bankDetails
          : bankDetails // ignore: cast_nullable_to_non_nullable
              as WithdrawBankDetail?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
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

  @override
  @pragma('vm:prefer-inline')
  $WithdrawBankDetailCopyWith<$Res>? get bankDetails {
    if (_value.bankDetails == null) {
      return null;
    }

    return $WithdrawBankDetailCopyWith<$Res>(_value.bankDetails!, (value) {
      return _then(_value.copyWith(bankDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WithdrawModelImplCopyWith<$Res>
    implements $WithdrawModelCopyWith<$Res> {
  factory _$$WithdrawModelImplCopyWith(
          _$WithdrawModelImpl value, $Res Function(_$WithdrawModelImpl) then) =
      __$$WithdrawModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'userId') UserModel? userId,
      @JsonKey(name: 'bankDetails') WithdrawBankDetail? bankDetails,
      @JsonKey(name: 'amount') int amount,
      @JsonKey(name: 'success') bool success,
      @JsonKey(name: 'createdAt') String createdAt,
      @JsonKey(name: 'updatedAt') String updatedAt});

  @override
  $UserModelCopyWith<$Res>? get userId;
  @override
  $WithdrawBankDetailCopyWith<$Res>? get bankDetails;
}

/// @nodoc
class __$$WithdrawModelImplCopyWithImpl<$Res>
    extends _$WithdrawModelCopyWithImpl<$Res, _$WithdrawModelImpl>
    implements _$$WithdrawModelImplCopyWith<$Res> {
  __$$WithdrawModelImplCopyWithImpl(
      _$WithdrawModelImpl _value, $Res Function(_$WithdrawModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? bankDetails = freezed,
    Object? amount = null,
    Object? success = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$WithdrawModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      bankDetails: freezed == bankDetails
          ? _value.bankDetails
          : bankDetails // ignore: cast_nullable_to_non_nullable
              as WithdrawBankDetail?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WithdrawModelImpl implements _WithdrawModel {
  _$WithdrawModelImpl(
      {@JsonKey(name: '_id') this.id = '',
      @JsonKey(name: 'userId') this.userId,
      @JsonKey(name: 'bankDetails') this.bankDetails,
      @JsonKey(name: 'amount') this.amount = 0,
      @JsonKey(name: 'success') this.success = false,
      @JsonKey(name: 'createdAt') this.createdAt = '',
      @JsonKey(name: 'updatedAt') this.updatedAt = ''});

  factory _$WithdrawModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WithdrawModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'userId')
  final UserModel? userId;
  @override
  @JsonKey(name: 'bankDetails')
  final WithdrawBankDetail? bankDetails;
  @override
  @JsonKey(name: 'amount')
  final int amount;
  @override
  @JsonKey(name: 'success')
  final bool success;
  @override
  @JsonKey(name: 'createdAt')
  final String createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final String updatedAt;

  @override
  String toString() {
    return 'WithdrawModel(id: $id, userId: $userId, bankDetails: $bankDetails, amount: $amount, success: $success, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithdrawModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.bankDetails, bankDetails) ||
                other.bankDetails == bankDetails) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, bankDetails, amount,
      success, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WithdrawModelImplCopyWith<_$WithdrawModelImpl> get copyWith =>
      __$$WithdrawModelImplCopyWithImpl<_$WithdrawModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WithdrawModelImplToJson(
      this,
    );
  }
}

abstract class _WithdrawModel implements WithdrawModel {
  factory _WithdrawModel(
          {@JsonKey(name: '_id') final String id,
          @JsonKey(name: 'userId') final UserModel? userId,
          @JsonKey(name: 'bankDetails') final WithdrawBankDetail? bankDetails,
          @JsonKey(name: 'amount') final int amount,
          @JsonKey(name: 'success') final bool success,
          @JsonKey(name: 'createdAt') final String createdAt,
          @JsonKey(name: 'updatedAt') final String updatedAt}) =
      _$WithdrawModelImpl;

  factory _WithdrawModel.fromJson(Map<String, dynamic> json) =
      _$WithdrawModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'userId')
  UserModel? get userId;
  @override
  @JsonKey(name: 'bankDetails')
  WithdrawBankDetail? get bankDetails;
  @override
  @JsonKey(name: 'amount')
  int get amount;
  @override
  @JsonKey(name: 'success')
  bool get success;
  @override
  @JsonKey(name: 'createdAt')
  String get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$WithdrawModelImplCopyWith<_$WithdrawModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WithdrawBankDetail _$WithdrawBankDetailFromJson(Map<String, dynamic> json) {
  return _WithdrawBankDetail.fromJson(json);
}

/// @nodoc
mixin _$WithdrawBankDetail {
  @JsonKey(name: 'accountNo')
  String get accountNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'bankName')
  String get bankName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ifscCode')
  String get ifscCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WithdrawBankDetailCopyWith<WithdrawBankDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WithdrawBankDetailCopyWith<$Res> {
  factory $WithdrawBankDetailCopyWith(
          WithdrawBankDetail value, $Res Function(WithdrawBankDetail) then) =
      _$WithdrawBankDetailCopyWithImpl<$Res, WithdrawBankDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'accountNo') String accountNo,
      @JsonKey(name: 'bankName') String bankName,
      @JsonKey(name: 'ifscCode') String ifscCode,
      @JsonKey(name: 'userId') String userId});
}

/// @nodoc
class _$WithdrawBankDetailCopyWithImpl<$Res, $Val extends WithdrawBankDetail>
    implements $WithdrawBankDetailCopyWith<$Res> {
  _$WithdrawBankDetailCopyWithImpl(this._value, this._then);

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
    Object? userId = null,
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
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WithdrawBankDetailImplCopyWith<$Res>
    implements $WithdrawBankDetailCopyWith<$Res> {
  factory _$$WithdrawBankDetailImplCopyWith(_$WithdrawBankDetailImpl value,
          $Res Function(_$WithdrawBankDetailImpl) then) =
      __$$WithdrawBankDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'accountNo') String accountNo,
      @JsonKey(name: 'bankName') String bankName,
      @JsonKey(name: 'ifscCode') String ifscCode,
      @JsonKey(name: 'userId') String userId});
}

/// @nodoc
class __$$WithdrawBankDetailImplCopyWithImpl<$Res>
    extends _$WithdrawBankDetailCopyWithImpl<$Res, _$WithdrawBankDetailImpl>
    implements _$$WithdrawBankDetailImplCopyWith<$Res> {
  __$$WithdrawBankDetailImplCopyWithImpl(_$WithdrawBankDetailImpl _value,
      $Res Function(_$WithdrawBankDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNo = null,
    Object? bankName = null,
    Object? ifscCode = null,
    Object? userId = null,
  }) {
    return _then(_$WithdrawBankDetailImpl(
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
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WithdrawBankDetailImpl implements _WithdrawBankDetail {
  _$WithdrawBankDetailImpl(
      {@JsonKey(name: 'accountNo') this.accountNo = '',
      @JsonKey(name: 'bankName') this.bankName = '',
      @JsonKey(name: 'ifscCode') this.ifscCode = '',
      @JsonKey(name: 'userId') this.userId = ''});

  factory _$WithdrawBankDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$WithdrawBankDetailImplFromJson(json);

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
  final String userId;

  @override
  String toString() {
    return 'WithdrawBankDetail(accountNo: $accountNo, bankName: $bankName, ifscCode: $ifscCode, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithdrawBankDetailImpl &&
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
  _$$WithdrawBankDetailImplCopyWith<_$WithdrawBankDetailImpl> get copyWith =>
      __$$WithdrawBankDetailImplCopyWithImpl<_$WithdrawBankDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WithdrawBankDetailImplToJson(
      this,
    );
  }
}

abstract class _WithdrawBankDetail implements WithdrawBankDetail {
  factory _WithdrawBankDetail(
      {@JsonKey(name: 'accountNo') final String accountNo,
      @JsonKey(name: 'bankName') final String bankName,
      @JsonKey(name: 'ifscCode') final String ifscCode,
      @JsonKey(name: 'userId') final String userId}) = _$WithdrawBankDetailImpl;

  factory _WithdrawBankDetail.fromJson(Map<String, dynamic> json) =
      _$WithdrawBankDetailImpl.fromJson;

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
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$WithdrawBankDetailImplCopyWith<_$WithdrawBankDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
