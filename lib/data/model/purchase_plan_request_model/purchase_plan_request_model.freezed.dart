// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_plan_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurchasePlanRequestModel _$PurchasePlanRequestModelFromJson(
    Map<String, dynamic> json) {
  return _PurchasePlanRequestModel.fromJson(json);
}

/// @nodoc
mixin _$PurchasePlanRequestModel {
  @JsonKey(name: 'status')
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<PurchasePlanRequest> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchasePlanRequestModelCopyWith<PurchasePlanRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasePlanRequestModelCopyWith<$Res> {
  factory $PurchasePlanRequestModelCopyWith(PurchasePlanRequestModel value,
          $Res Function(PurchasePlanRequestModel) then) =
      _$PurchasePlanRequestModelCopyWithImpl<$Res, PurchasePlanRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') List<PurchasePlanRequest> data});
}

/// @nodoc
class _$PurchasePlanRequestModelCopyWithImpl<$Res,
        $Val extends PurchasePlanRequestModel>
    implements $PurchasePlanRequestModelCopyWith<$Res> {
  _$PurchasePlanRequestModelCopyWithImpl(this._value, this._then);

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
              as List<PurchasePlanRequest>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchasePlanRequestModelImplCopyWith<$Res>
    implements $PurchasePlanRequestModelCopyWith<$Res> {
  factory _$$PurchasePlanRequestModelImplCopyWith(
          _$PurchasePlanRequestModelImpl value,
          $Res Function(_$PurchasePlanRequestModelImpl) then) =
      __$$PurchasePlanRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') List<PurchasePlanRequest> data});
}

/// @nodoc
class __$$PurchasePlanRequestModelImplCopyWithImpl<$Res>
    extends _$PurchasePlanRequestModelCopyWithImpl<$Res,
        _$PurchasePlanRequestModelImpl>
    implements _$$PurchasePlanRequestModelImplCopyWith<$Res> {
  __$$PurchasePlanRequestModelImplCopyWithImpl(
      _$PurchasePlanRequestModelImpl _value,
      $Res Function(_$PurchasePlanRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$PurchasePlanRequestModelImpl(
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
              as List<PurchasePlanRequest>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchasePlanRequestModelImpl implements _PurchasePlanRequestModel {
  _$PurchasePlanRequestModelImpl(
      {@JsonKey(name: 'status') this.status = false,
      @JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'data') final List<PurchasePlanRequest> data = const []})
      : _data = data;

  factory _$PurchasePlanRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchasePlanRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool status;
  @override
  @JsonKey(name: 'message')
  final String message;
  final List<PurchasePlanRequest> _data;
  @override
  @JsonKey(name: 'data')
  List<PurchasePlanRequest> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'PurchasePlanRequestModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchasePlanRequestModelImpl &&
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
  _$$PurchasePlanRequestModelImplCopyWith<_$PurchasePlanRequestModelImpl>
      get copyWith => __$$PurchasePlanRequestModelImplCopyWithImpl<
          _$PurchasePlanRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchasePlanRequestModelImplToJson(
      this,
    );
  }
}

abstract class _PurchasePlanRequestModel implements PurchasePlanRequestModel {
  factory _PurchasePlanRequestModel(
          {@JsonKey(name: 'status') final bool status,
          @JsonKey(name: 'message') final String message,
          @JsonKey(name: 'data') final List<PurchasePlanRequest> data}) =
      _$PurchasePlanRequestModelImpl;

  factory _PurchasePlanRequestModel.fromJson(Map<String, dynamic> json) =
      _$PurchasePlanRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool get status;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'data')
  List<PurchasePlanRequest> get data;
  @override
  @JsonKey(ignore: true)
  _$$PurchasePlanRequestModelImplCopyWith<_$PurchasePlanRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PurchasePlanRequest _$PurchasePlanRequestFromJson(Map<String, dynamic> json) {
  return _PurchasePlanRequest.fromJson(json);
}

/// @nodoc
mixin _$PurchasePlanRequest {
  @JsonKey(name: '_id')
  String get planId => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  UserModel? get userId => throw _privateConstructorUsedError;
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
  $PurchasePlanRequestCopyWith<PurchasePlanRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasePlanRequestCopyWith<$Res> {
  factory $PurchasePlanRequestCopyWith(
          PurchasePlanRequest value, $Res Function(PurchasePlanRequest) then) =
      _$PurchasePlanRequestCopyWithImpl<$Res, PurchasePlanRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String planId,
      @JsonKey(name: 'status') bool status,
      @JsonKey(name: 'userId') UserModel? userId,
      @JsonKey(name: 'planName') String planName,
      @JsonKey(name: 'amount') int amount,
      @JsonKey(name: 'purchaseDate') String purchaseDate,
      @JsonKey(name: 'expiry') String expiry,
      @JsonKey(name: 'createdAt') String createdAt,
      @JsonKey(name: 'image') String image});

  $UserModelCopyWith<$Res>? get userId;
}

/// @nodoc
class _$PurchasePlanRequestCopyWithImpl<$Res, $Val extends PurchasePlanRequest>
    implements $PurchasePlanRequestCopyWith<$Res> {
  _$PurchasePlanRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? status = null,
    Object? userId = freezed,
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
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UserModel?,
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
abstract class _$$PurchasePlanRequestImplCopyWith<$Res>
    implements $PurchasePlanRequestCopyWith<$Res> {
  factory _$$PurchasePlanRequestImplCopyWith(_$PurchasePlanRequestImpl value,
          $Res Function(_$PurchasePlanRequestImpl) then) =
      __$$PurchasePlanRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String planId,
      @JsonKey(name: 'status') bool status,
      @JsonKey(name: 'userId') UserModel? userId,
      @JsonKey(name: 'planName') String planName,
      @JsonKey(name: 'amount') int amount,
      @JsonKey(name: 'purchaseDate') String purchaseDate,
      @JsonKey(name: 'expiry') String expiry,
      @JsonKey(name: 'createdAt') String createdAt,
      @JsonKey(name: 'image') String image});

  @override
  $UserModelCopyWith<$Res>? get userId;
}

/// @nodoc
class __$$PurchasePlanRequestImplCopyWithImpl<$Res>
    extends _$PurchasePlanRequestCopyWithImpl<$Res, _$PurchasePlanRequestImpl>
    implements _$$PurchasePlanRequestImplCopyWith<$Res> {
  __$$PurchasePlanRequestImplCopyWithImpl(_$PurchasePlanRequestImpl _value,
      $Res Function(_$PurchasePlanRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planId = null,
    Object? status = null,
    Object? userId = freezed,
    Object? planName = null,
    Object? amount = null,
    Object? purchaseDate = null,
    Object? expiry = null,
    Object? createdAt = null,
    Object? image = null,
  }) {
    return _then(_$PurchasePlanRequestImpl(
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UserModel?,
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
class _$PurchasePlanRequestImpl implements _PurchasePlanRequest {
  _$PurchasePlanRequestImpl(
      {@JsonKey(name: '_id') this.planId = '',
      @JsonKey(name: 'status') this.status = false,
      @JsonKey(name: 'userId') this.userId,
      @JsonKey(name: 'planName') this.planName = '',
      @JsonKey(name: 'amount') this.amount = 0,
      @JsonKey(name: 'purchaseDate') this.purchaseDate = '',
      @JsonKey(name: 'expiry') this.expiry = '',
      @JsonKey(name: 'createdAt') this.createdAt = '',
      @JsonKey(name: 'image') this.image = ''});

  factory _$PurchasePlanRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchasePlanRequestImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String planId;
  @override
  @JsonKey(name: 'status')
  final bool status;
  @override
  @JsonKey(name: 'userId')
  final UserModel? userId;
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
    return 'PurchasePlanRequest(planId: $planId, status: $status, userId: $userId, planName: $planName, amount: $amount, purchaseDate: $purchaseDate, expiry: $expiry, createdAt: $createdAt, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchasePlanRequestImpl &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userId, userId) || other.userId == userId) &&
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
  int get hashCode => Object.hash(runtimeType, planId, status, userId, planName,
      amount, purchaseDate, expiry, createdAt, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchasePlanRequestImplCopyWith<_$PurchasePlanRequestImpl> get copyWith =>
      __$$PurchasePlanRequestImplCopyWithImpl<_$PurchasePlanRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchasePlanRequestImplToJson(
      this,
    );
  }
}

abstract class _PurchasePlanRequest implements PurchasePlanRequest {
  factory _PurchasePlanRequest(
      {@JsonKey(name: '_id') final String planId,
      @JsonKey(name: 'status') final bool status,
      @JsonKey(name: 'userId') final UserModel? userId,
      @JsonKey(name: 'planName') final String planName,
      @JsonKey(name: 'amount') final int amount,
      @JsonKey(name: 'purchaseDate') final String purchaseDate,
      @JsonKey(name: 'expiry') final String expiry,
      @JsonKey(name: 'createdAt') final String createdAt,
      @JsonKey(name: 'image') final String image}) = _$PurchasePlanRequestImpl;

  factory _PurchasePlanRequest.fromJson(Map<String, dynamic> json) =
      _$PurchasePlanRequestImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get planId;
  @override
  @JsonKey(name: 'status')
  bool get status;
  @override
  @JsonKey(name: 'userId')
  UserModel? get userId;
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
  _$$PurchasePlanRequestImplCopyWith<_$PurchasePlanRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
