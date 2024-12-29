// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_bank_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllBankDetailModel _$AllBankDetailModelFromJson(Map<String, dynamic> json) {
  return _AllBankDetailModel.fromJson(json);
}

/// @nodoc
mixin _$AllBankDetailModel {
  @JsonKey(name: 'status')
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<BankDetail> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllBankDetailModelCopyWith<AllBankDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllBankDetailModelCopyWith<$Res> {
  factory $AllBankDetailModelCopyWith(
          AllBankDetailModel value, $Res Function(AllBankDetailModel) then) =
      _$AllBankDetailModelCopyWithImpl<$Res, AllBankDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') List<BankDetail> data});
}

/// @nodoc
class _$AllBankDetailModelCopyWithImpl<$Res, $Val extends AllBankDetailModel>
    implements $AllBankDetailModelCopyWith<$Res> {
  _$AllBankDetailModelCopyWithImpl(this._value, this._then);

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
              as List<BankDetail>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllBankDetailModelImplCopyWith<$Res>
    implements $AllBankDetailModelCopyWith<$Res> {
  factory _$$AllBankDetailModelImplCopyWith(_$AllBankDetailModelImpl value,
          $Res Function(_$AllBankDetailModelImpl) then) =
      __$$AllBankDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') List<BankDetail> data});
}

/// @nodoc
class __$$AllBankDetailModelImplCopyWithImpl<$Res>
    extends _$AllBankDetailModelCopyWithImpl<$Res, _$AllBankDetailModelImpl>
    implements _$$AllBankDetailModelImplCopyWith<$Res> {
  __$$AllBankDetailModelImplCopyWithImpl(_$AllBankDetailModelImpl _value,
      $Res Function(_$AllBankDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$AllBankDetailModelImpl(
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
              as List<BankDetail>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllBankDetailModelImpl implements _AllBankDetailModel {
  _$AllBankDetailModelImpl(
      {@JsonKey(name: 'status') this.status = false,
      @JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'data') final List<BankDetail> data = const []})
      : _data = data;

  factory _$AllBankDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllBankDetailModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool status;
  @override
  @JsonKey(name: 'message')
  final String message;
  final List<BankDetail> _data;
  @override
  @JsonKey(name: 'data')
  List<BankDetail> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'AllBankDetailModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllBankDetailModelImpl &&
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
  _$$AllBankDetailModelImplCopyWith<_$AllBankDetailModelImpl> get copyWith =>
      __$$AllBankDetailModelImplCopyWithImpl<_$AllBankDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllBankDetailModelImplToJson(
      this,
    );
  }
}

abstract class _AllBankDetailModel implements AllBankDetailModel {
  factory _AllBankDetailModel(
          {@JsonKey(name: 'status') final bool status,
          @JsonKey(name: 'message') final String message,
          @JsonKey(name: 'data') final List<BankDetail> data}) =
      _$AllBankDetailModelImpl;

  factory _AllBankDetailModel.fromJson(Map<String, dynamic> json) =
      _$AllBankDetailModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool get status;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'data')
  List<BankDetail> get data;
  @override
  @JsonKey(ignore: true)
  _$$AllBankDetailModelImplCopyWith<_$AllBankDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
