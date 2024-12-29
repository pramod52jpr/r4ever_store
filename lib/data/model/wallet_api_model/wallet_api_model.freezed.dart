// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WalletApiModel _$WalletApiModelFromJson(Map<String, dynamic> json) {
  return _WalletApiModel.fromJson(json);
}

/// @nodoc
mixin _$WalletApiModel {
  @JsonKey(name: 'status')
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  WalletData? get walletData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletApiModelCopyWith<WalletApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletApiModelCopyWith<$Res> {
  factory $WalletApiModelCopyWith(
          WalletApiModel value, $Res Function(WalletApiModel) then) =
      _$WalletApiModelCopyWithImpl<$Res, WalletApiModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') WalletData? walletData});

  $WalletDataCopyWith<$Res>? get walletData;
}

/// @nodoc
class _$WalletApiModelCopyWithImpl<$Res, $Val extends WalletApiModel>
    implements $WalletApiModelCopyWith<$Res> {
  _$WalletApiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? walletData = freezed,
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
      walletData: freezed == walletData
          ? _value.walletData
          : walletData // ignore: cast_nullable_to_non_nullable
              as WalletData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletDataCopyWith<$Res>? get walletData {
    if (_value.walletData == null) {
      return null;
    }

    return $WalletDataCopyWith<$Res>(_value.walletData!, (value) {
      return _then(_value.copyWith(walletData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WalletApiModelImplCopyWith<$Res>
    implements $WalletApiModelCopyWith<$Res> {
  factory _$$WalletApiModelImplCopyWith(_$WalletApiModelImpl value,
          $Res Function(_$WalletApiModelImpl) then) =
      __$$WalletApiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') WalletData? walletData});

  @override
  $WalletDataCopyWith<$Res>? get walletData;
}

/// @nodoc
class __$$WalletApiModelImplCopyWithImpl<$Res>
    extends _$WalletApiModelCopyWithImpl<$Res, _$WalletApiModelImpl>
    implements _$$WalletApiModelImplCopyWith<$Res> {
  __$$WalletApiModelImplCopyWithImpl(
      _$WalletApiModelImpl _value, $Res Function(_$WalletApiModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? walletData = freezed,
  }) {
    return _then(_$WalletApiModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      walletData: freezed == walletData
          ? _value.walletData
          : walletData // ignore: cast_nullable_to_non_nullable
              as WalletData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletApiModelImpl implements _WalletApiModel {
  _$WalletApiModelImpl(
      {@JsonKey(name: 'status') this.status = false,
      @JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'data') this.walletData});

  factory _$WalletApiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletApiModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool status;
  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'data')
  final WalletData? walletData;

  @override
  String toString() {
    return 'WalletApiModel(status: $status, message: $message, walletData: $walletData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletApiModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.walletData, walletData) ||
                other.walletData == walletData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, walletData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletApiModelImplCopyWith<_$WalletApiModelImpl> get copyWith =>
      __$$WalletApiModelImplCopyWithImpl<_$WalletApiModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletApiModelImplToJson(
      this,
    );
  }
}

abstract class _WalletApiModel implements WalletApiModel {
  factory _WalletApiModel(
          {@JsonKey(name: 'status') final bool status,
          @JsonKey(name: 'message') final String message,
          @JsonKey(name: 'data') final WalletData? walletData}) =
      _$WalletApiModelImpl;

  factory _WalletApiModel.fromJson(Map<String, dynamic> json) =
      _$WalletApiModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool get status;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'data')
  WalletData? get walletData;
  @override
  @JsonKey(ignore: true)
  _$$WalletApiModelImplCopyWith<_$WalletApiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WalletData _$WalletDataFromJson(Map<String, dynamic> json) {
  return _WalletData.fromJson(json);
}

/// @nodoc
mixin _$WalletData {
  @JsonKey(name: 'wallet')
  int get wallet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletDataCopyWith<WalletData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletDataCopyWith<$Res> {
  factory $WalletDataCopyWith(
          WalletData value, $Res Function(WalletData) then) =
      _$WalletDataCopyWithImpl<$Res, WalletData>;
  @useResult
  $Res call({@JsonKey(name: 'wallet') int wallet});
}

/// @nodoc
class _$WalletDataCopyWithImpl<$Res, $Val extends WalletData>
    implements $WalletDataCopyWith<$Res> {
  _$WalletDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallet = null,
  }) {
    return _then(_value.copyWith(
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletDataImplCopyWith<$Res>
    implements $WalletDataCopyWith<$Res> {
  factory _$$WalletDataImplCopyWith(
          _$WalletDataImpl value, $Res Function(_$WalletDataImpl) then) =
      __$$WalletDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'wallet') int wallet});
}

/// @nodoc
class __$$WalletDataImplCopyWithImpl<$Res>
    extends _$WalletDataCopyWithImpl<$Res, _$WalletDataImpl>
    implements _$$WalletDataImplCopyWith<$Res> {
  __$$WalletDataImplCopyWithImpl(
      _$WalletDataImpl _value, $Res Function(_$WalletDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallet = null,
  }) {
    return _then(_$WalletDataImpl(
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletDataImpl implements _WalletData {
  _$WalletDataImpl({@JsonKey(name: 'wallet') this.wallet = 0});

  factory _$WalletDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletDataImplFromJson(json);

  @override
  @JsonKey(name: 'wallet')
  final int wallet;

  @override
  String toString() {
    return 'WalletData(wallet: $wallet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletDataImpl &&
            (identical(other.wallet, wallet) || other.wallet == wallet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, wallet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletDataImplCopyWith<_$WalletDataImpl> get copyWith =>
      __$$WalletDataImplCopyWithImpl<_$WalletDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletDataImplToJson(
      this,
    );
  }
}

abstract class _WalletData implements WalletData {
  factory _WalletData({@JsonKey(name: 'wallet') final int wallet}) =
      _$WalletDataImpl;

  factory _WalletData.fromJson(Map<String, dynamic> json) =
      _$WalletDataImpl.fromJson;

  @override
  @JsonKey(name: 'wallet')
  int get wallet;
  @override
  @JsonKey(ignore: true)
  _$$WalletDataImplCopyWith<_$WalletDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
