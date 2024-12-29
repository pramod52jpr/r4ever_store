// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ViewProfileModel _$ViewProfileModelFromJson(Map<String, dynamic> json) {
  return _ViewProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ViewProfileModel {
  @JsonKey(name: 'status')
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  UserModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViewProfileModelCopyWith<ViewProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewProfileModelCopyWith<$Res> {
  factory $ViewProfileModelCopyWith(
          ViewProfileModel value, $Res Function(ViewProfileModel) then) =
      _$ViewProfileModelCopyWithImpl<$Res, ViewProfileModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') UserModel? data});

  $UserModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$ViewProfileModelCopyWithImpl<$Res, $Val extends ViewProfileModel>
    implements $ViewProfileModelCopyWith<$Res> {
  _$ViewProfileModelCopyWithImpl(this._value, this._then);

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
              as UserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ViewProfileModelImplCopyWith<$Res>
    implements $ViewProfileModelCopyWith<$Res> {
  factory _$$ViewProfileModelImplCopyWith(_$ViewProfileModelImpl value,
          $Res Function(_$ViewProfileModelImpl) then) =
      __$$ViewProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') UserModel? data});

  @override
  $UserModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ViewProfileModelImplCopyWithImpl<$Res>
    extends _$ViewProfileModelCopyWithImpl<$Res, _$ViewProfileModelImpl>
    implements _$$ViewProfileModelImplCopyWith<$Res> {
  __$$ViewProfileModelImplCopyWithImpl(_$ViewProfileModelImpl _value,
      $Res Function(_$ViewProfileModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$ViewProfileModelImpl(
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
              as UserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ViewProfileModelImpl implements _ViewProfileModel {
  _$ViewProfileModelImpl(
      {@JsonKey(name: 'status') this.status = false,
      @JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'data') this.data});

  factory _$ViewProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViewProfileModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool status;
  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'data')
  final UserModel? data;

  @override
  String toString() {
    return 'ViewProfileModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewProfileModelImpl &&
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
  _$$ViewProfileModelImplCopyWith<_$ViewProfileModelImpl> get copyWith =>
      __$$ViewProfileModelImplCopyWithImpl<_$ViewProfileModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViewProfileModelImplToJson(
      this,
    );
  }
}

abstract class _ViewProfileModel implements ViewProfileModel {
  factory _ViewProfileModel(
      {@JsonKey(name: 'status') final bool status,
      @JsonKey(name: 'message') final String message,
      @JsonKey(name: 'data') final UserModel? data}) = _$ViewProfileModelImpl;

  factory _ViewProfileModel.fromJson(Map<String, dynamic> json) =
      _$ViewProfileModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool get status;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'data')
  UserModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$ViewProfileModelImplCopyWith<_$ViewProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'refer_code')
  String get referCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'referral_money')
  int get referralMoney => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'age')
  String get age => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  String get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'work')
  String get work => throw _privateConstructorUsedError;
  @JsonKey(name: 'whatsappNo')
  String get whatsappNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'blocked')
  bool get blocked => throw _privateConstructorUsedError;
  @JsonKey(name: 'level')
  int get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'plan')
  PlanModel? get plan => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'refer_code') String referCode,
      @JsonKey(name: 'referral_money') int referralMoney,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'phone') String phone,
      @JsonKey(name: 'age') String age,
      @JsonKey(name: 'gender') String gender,
      @JsonKey(name: 'work') String work,
      @JsonKey(name: 'whatsappNo') String whatsappNo,
      @JsonKey(name: 'location') String location,
      @JsonKey(name: 'blocked') bool blocked,
      @JsonKey(name: 'level') int level,
      @JsonKey(name: 'plan') PlanModel? plan});

  $PlanModelCopyWith<$Res>? get plan;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? referCode = null,
    Object? referralMoney = null,
    Object? type = null,
    Object? name = null,
    Object? phone = null,
    Object? age = null,
    Object? gender = null,
    Object? work = null,
    Object? whatsappNo = null,
    Object? location = null,
    Object? blocked = null,
    Object? level = null,
    Object? plan = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      referCode: null == referCode
          ? _value.referCode
          : referCode // ignore: cast_nullable_to_non_nullable
              as String,
      referralMoney: null == referralMoney
          ? _value.referralMoney
          : referralMoney // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      work: null == work
          ? _value.work
          : work // ignore: cast_nullable_to_non_nullable
              as String,
      whatsappNo: null == whatsappNo
          ? _value.whatsappNo
          : whatsappNo // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      blocked: null == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      plan: freezed == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as PlanModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlanModelCopyWith<$Res>? get plan {
    if (_value.plan == null) {
      return null;
    }

    return $PlanModelCopyWith<$Res>(_value.plan!, (value) {
      return _then(_value.copyWith(plan: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'refer_code') String referCode,
      @JsonKey(name: 'referral_money') int referralMoney,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'phone') String phone,
      @JsonKey(name: 'age') String age,
      @JsonKey(name: 'gender') String gender,
      @JsonKey(name: 'work') String work,
      @JsonKey(name: 'whatsappNo') String whatsappNo,
      @JsonKey(name: 'location') String location,
      @JsonKey(name: 'blocked') bool blocked,
      @JsonKey(name: 'level') int level,
      @JsonKey(name: 'plan') PlanModel? plan});

  @override
  $PlanModelCopyWith<$Res>? get plan;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? referCode = null,
    Object? referralMoney = null,
    Object? type = null,
    Object? name = null,
    Object? phone = null,
    Object? age = null,
    Object? gender = null,
    Object? work = null,
    Object? whatsappNo = null,
    Object? location = null,
    Object? blocked = null,
    Object? level = null,
    Object? plan = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      referCode: null == referCode
          ? _value.referCode
          : referCode // ignore: cast_nullable_to_non_nullable
              as String,
      referralMoney: null == referralMoney
          ? _value.referralMoney
          : referralMoney // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      work: null == work
          ? _value.work
          : work // ignore: cast_nullable_to_non_nullable
              as String,
      whatsappNo: null == whatsappNo
          ? _value.whatsappNo
          : whatsappNo // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      blocked: null == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      plan: freezed == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as PlanModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  _$UserModelImpl(
      {@JsonKey(name: '_id') this.id = '',
      @JsonKey(name: 'refer_code') this.referCode = '',
      @JsonKey(name: 'referral_money') this.referralMoney = 0,
      @JsonKey(name: 'type') this.type = '',
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'phone') this.phone = '',
      @JsonKey(name: 'age') this.age = '',
      @JsonKey(name: 'gender') this.gender = '',
      @JsonKey(name: 'work') this.work = '',
      @JsonKey(name: 'whatsappNo') this.whatsappNo = '',
      @JsonKey(name: 'location') this.location = '',
      @JsonKey(name: 'blocked') this.blocked = false,
      @JsonKey(name: 'level') this.level = 0,
      @JsonKey(name: 'plan') this.plan});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'refer_code')
  final String referCode;
  @override
  @JsonKey(name: 'referral_money')
  final int referralMoney;
  @override
  @JsonKey(name: 'type')
  final String type;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'phone')
  final String phone;
  @override
  @JsonKey(name: 'age')
  final String age;
  @override
  @JsonKey(name: 'gender')
  final String gender;
  @override
  @JsonKey(name: 'work')
  final String work;
  @override
  @JsonKey(name: 'whatsappNo')
  final String whatsappNo;
  @override
  @JsonKey(name: 'location')
  final String location;
  @override
  @JsonKey(name: 'blocked')
  final bool blocked;
  @override
  @JsonKey(name: 'level')
  final int level;
  @override
  @JsonKey(name: 'plan')
  final PlanModel? plan;

  @override
  String toString() {
    return 'UserModel(id: $id, referCode: $referCode, referralMoney: $referralMoney, type: $type, name: $name, phone: $phone, age: $age, gender: $gender, work: $work, whatsappNo: $whatsappNo, location: $location, blocked: $blocked, level: $level, plan: $plan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.referCode, referCode) ||
                other.referCode == referCode) &&
            (identical(other.referralMoney, referralMoney) ||
                other.referralMoney == referralMoney) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.work, work) || other.work == work) &&
            (identical(other.whatsappNo, whatsappNo) ||
                other.whatsappNo == whatsappNo) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.plan, plan) || other.plan == plan));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      referCode,
      referralMoney,
      type,
      name,
      phone,
      age,
      gender,
      work,
      whatsappNo,
      location,
      blocked,
      level,
      plan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {@JsonKey(name: '_id') final String id,
      @JsonKey(name: 'refer_code') final String referCode,
      @JsonKey(name: 'referral_money') final int referralMoney,
      @JsonKey(name: 'type') final String type,
      @JsonKey(name: 'name') final String name,
      @JsonKey(name: 'phone') final String phone,
      @JsonKey(name: 'age') final String age,
      @JsonKey(name: 'gender') final String gender,
      @JsonKey(name: 'work') final String work,
      @JsonKey(name: 'whatsappNo') final String whatsappNo,
      @JsonKey(name: 'location') final String location,
      @JsonKey(name: 'blocked') final bool blocked,
      @JsonKey(name: 'level') final int level,
      @JsonKey(name: 'plan') final PlanModel? plan}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'refer_code')
  String get referCode;
  @override
  @JsonKey(name: 'referral_money')
  int get referralMoney;
  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'phone')
  String get phone;
  @override
  @JsonKey(name: 'age')
  String get age;
  @override
  @JsonKey(name: 'gender')
  String get gender;
  @override
  @JsonKey(name: 'work')
  String get work;
  @override
  @JsonKey(name: 'whatsappNo')
  String get whatsappNo;
  @override
  @JsonKey(name: 'location')
  String get location;
  @override
  @JsonKey(name: 'blocked')
  bool get blocked;
  @override
  @JsonKey(name: 'level')
  int get level;
  @override
  @JsonKey(name: 'plan')
  PlanModel? get plan;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlanModel _$PlanModelFromJson(Map<String, dynamic> json) {
  return _PlanModel.fromJson(json);
}

/// @nodoc
mixin _$PlanModel {
  @JsonKey(name: '_id')
  String get planId => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'planName')
  String get planName => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  int get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchaseDate')
  String get purchaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiry')
  String get expiry => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlanModelCopyWith<PlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanModelCopyWith<$Res> {
  factory $PlanModelCopyWith(PlanModel value, $Res Function(PlanModel) then) =
      _$PlanModelCopyWithImpl<$Res, PlanModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String planId,
      @JsonKey(name: 'status') bool status,
      @JsonKey(name: 'planName') String planName,
      @JsonKey(name: 'amount') int amount,
      @JsonKey(name: 'purchaseDate') String purchaseDate,
      @JsonKey(name: 'expiry') String expiry,
      @JsonKey(name: 'createdAt') String createdAt,
      @JsonKey(name: 'image') String image});
}

/// @nodoc
class _$PlanModelCopyWithImpl<$Res, $Val extends PlanModel>
    implements $PlanModelCopyWith<$Res> {
  _$PlanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? status = null,
    Object? planName = null,
    Object? amount = null,
    Object? purchaseDate = null,
    Object? expiry = null,
    Object? createdAt = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      planName: null == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      expiry: null == expiry
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlanModelImplCopyWith<$Res>
    implements $PlanModelCopyWith<$Res> {
  factory _$$PlanModelImplCopyWith(
          _$PlanModelImpl value, $Res Function(_$PlanModelImpl) then) =
      __$$PlanModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String planId,
      @JsonKey(name: 'status') bool status,
      @JsonKey(name: 'planName') String planName,
      @JsonKey(name: 'amount') int amount,
      @JsonKey(name: 'purchaseDate') String purchaseDate,
      @JsonKey(name: 'expiry') String expiry,
      @JsonKey(name: 'createdAt') String createdAt,
      @JsonKey(name: 'image') String image});
}

/// @nodoc
class __$$PlanModelImplCopyWithImpl<$Res>
    extends _$PlanModelCopyWithImpl<$Res, _$PlanModelImpl>
    implements _$$PlanModelImplCopyWith<$Res> {
  __$$PlanModelImplCopyWithImpl(
      _$PlanModelImpl _value, $Res Function(_$PlanModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? status = null,
    Object? planName = null,
    Object? amount = null,
    Object? purchaseDate = null,
    Object? expiry = null,
    Object? createdAt = null,
    Object? image = null,
  }) {
    return _then(_$PlanModelImpl(
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      planName: null == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      expiry: null == expiry
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanModelImpl implements _PlanModel {
  _$PlanModelImpl(
      {@JsonKey(name: '_id') this.planId = '',
      @JsonKey(name: 'status') this.status = false,
      @JsonKey(name: 'planName') this.planName = '',
      @JsonKey(name: 'amount') this.amount = 0,
      @JsonKey(name: 'purchaseDate') this.purchaseDate = '',
      @JsonKey(name: 'expiry') this.expiry = '',
      @JsonKey(name: 'createdAt') this.createdAt = '',
      @JsonKey(name: 'image') this.image = ''});

  factory _$PlanModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String planId;
  @override
  @JsonKey(name: 'status')
  final bool status;
  @override
  @JsonKey(name: 'planName')
  final String planName;
  @override
  @JsonKey(name: 'amount')
  final int amount;
  @override
  @JsonKey(name: 'purchaseDate')
  final String purchaseDate;
  @override
  @JsonKey(name: 'expiry')
  final String expiry;
  @override
  @JsonKey(name: 'createdAt')
  final String createdAt;
  @override
  @JsonKey(name: 'image')
  final String image;

  @override
  String toString() {
    return 'PlanModel(planId: $planId, status: $status, planName: $planName, amount: $amount, purchaseDate: $purchaseDate, expiry: $expiry, createdAt: $createdAt, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanModelImpl &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.planName, planName) ||
                other.planName == planName) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.expiry, expiry) || other.expiry == expiry) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, planId, status, planName, amount,
      purchaseDate, expiry, createdAt, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanModelImplCopyWith<_$PlanModelImpl> get copyWith =>
      __$$PlanModelImplCopyWithImpl<_$PlanModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanModelImplToJson(
      this,
    );
  }
}

abstract class _PlanModel implements PlanModel {
  factory _PlanModel(
      {@JsonKey(name: '_id') final String planId,
      @JsonKey(name: 'status') final bool status,
      @JsonKey(name: 'planName') final String planName,
      @JsonKey(name: 'amount') final int amount,
      @JsonKey(name: 'purchaseDate') final String purchaseDate,
      @JsonKey(name: 'expiry') final String expiry,
      @JsonKey(name: 'createdAt') final String createdAt,
      @JsonKey(name: 'image') final String image}) = _$PlanModelImpl;

  factory _PlanModel.fromJson(Map<String, dynamic> json) =
      _$PlanModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get planId;
  @override
  @JsonKey(name: 'status')
  bool get status;
  @override
  @JsonKey(name: 'planName')
  String get planName;
  @override
  @JsonKey(name: 'amount')
  int get amount;
  @override
  @JsonKey(name: 'purchaseDate')
  String get purchaseDate;
  @override
  @JsonKey(name: 'expiry')
  String get expiry;
  @override
  @JsonKey(name: 'createdAt')
  String get createdAt;
  @override
  @JsonKey(name: 'image')
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$PlanModelImplCopyWith<_$PlanModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
