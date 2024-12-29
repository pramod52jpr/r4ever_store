// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_holidays_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllHolidaysModel _$AllHolidaysModelFromJson(Map<String, dynamic> json) {
  return _AllHolidaysModel.fromJson(json);
}

/// @nodoc
mixin _$AllHolidaysModel {
  @JsonKey(name: 'status')
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<HolidayModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllHolidaysModelCopyWith<AllHolidaysModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllHolidaysModelCopyWith<$Res> {
  factory $AllHolidaysModelCopyWith(
          AllHolidaysModel value, $Res Function(AllHolidaysModel) then) =
      _$AllHolidaysModelCopyWithImpl<$Res, AllHolidaysModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') List<HolidayModel> data});
}

/// @nodoc
class _$AllHolidaysModelCopyWithImpl<$Res, $Val extends AllHolidaysModel>
    implements $AllHolidaysModelCopyWith<$Res> {
  _$AllHolidaysModelCopyWithImpl(this._value, this._then);

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
              as List<HolidayModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllHolidaysModelImplCopyWith<$Res>
    implements $AllHolidaysModelCopyWith<$Res> {
  factory _$$AllHolidaysModelImplCopyWith(_$AllHolidaysModelImpl value,
          $Res Function(_$AllHolidaysModelImpl) then) =
      __$$AllHolidaysModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') List<HolidayModel> data});
}

/// @nodoc
class __$$AllHolidaysModelImplCopyWithImpl<$Res>
    extends _$AllHolidaysModelCopyWithImpl<$Res, _$AllHolidaysModelImpl>
    implements _$$AllHolidaysModelImplCopyWith<$Res> {
  __$$AllHolidaysModelImplCopyWithImpl(_$AllHolidaysModelImpl _value,
      $Res Function(_$AllHolidaysModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$AllHolidaysModelImpl(
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
              as List<HolidayModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllHolidaysModelImpl implements _AllHolidaysModel {
  _$AllHolidaysModelImpl(
      {@JsonKey(name: 'status') this.status = false,
      @JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'data') final List<HolidayModel> data = const []})
      : _data = data;

  factory _$AllHolidaysModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllHolidaysModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool status;
  @override
  @JsonKey(name: 'message')
  final String message;
  final List<HolidayModel> _data;
  @override
  @JsonKey(name: 'data')
  List<HolidayModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'AllHolidaysModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllHolidaysModelImpl &&
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
  _$$AllHolidaysModelImplCopyWith<_$AllHolidaysModelImpl> get copyWith =>
      __$$AllHolidaysModelImplCopyWithImpl<_$AllHolidaysModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllHolidaysModelImplToJson(
      this,
    );
  }
}

abstract class _AllHolidaysModel implements AllHolidaysModel {
  factory _AllHolidaysModel(
          {@JsonKey(name: 'status') final bool status,
          @JsonKey(name: 'message') final String message,
          @JsonKey(name: 'data') final List<HolidayModel> data}) =
      _$AllHolidaysModelImpl;

  factory _AllHolidaysModel.fromJson(Map<String, dynamic> json) =
      _$AllHolidaysModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool get status;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'data')
  List<HolidayModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$AllHolidaysModelImplCopyWith<_$AllHolidaysModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HolidayModel _$HolidayModelFromJson(Map<String, dynamic> json) {
  return _HolidayModel.fromJson(json);
}

/// @nodoc
mixin _$HolidayModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'day')
  int get day => throw _privateConstructorUsedError;
  @JsonKey(name: 'month')
  int get month => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HolidayModelCopyWith<HolidayModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HolidayModelCopyWith<$Res> {
  factory $HolidayModelCopyWith(
          HolidayModel value, $Res Function(HolidayModel) then) =
      _$HolidayModelCopyWithImpl<$Res, HolidayModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'day') int day,
      @JsonKey(name: 'month') int month});
}

/// @nodoc
class _$HolidayModelCopyWithImpl<$Res, $Val extends HolidayModel>
    implements $HolidayModelCopyWith<$Res> {
  _$HolidayModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? day = null,
    Object? month = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HolidayModelImplCopyWith<$Res>
    implements $HolidayModelCopyWith<$Res> {
  factory _$$HolidayModelImplCopyWith(
          _$HolidayModelImpl value, $Res Function(_$HolidayModelImpl) then) =
      __$$HolidayModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'day') int day,
      @JsonKey(name: 'month') int month});
}

/// @nodoc
class __$$HolidayModelImplCopyWithImpl<$Res>
    extends _$HolidayModelCopyWithImpl<$Res, _$HolidayModelImpl>
    implements _$$HolidayModelImplCopyWith<$Res> {
  __$$HolidayModelImplCopyWithImpl(
      _$HolidayModelImpl _value, $Res Function(_$HolidayModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? day = null,
    Object? month = null,
  }) {
    return _then(_$HolidayModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HolidayModelImpl implements _HolidayModel {
  _$HolidayModelImpl(
      {@JsonKey(name: '_id') this.id = '',
      @JsonKey(name: 'title') this.title = '',
      @JsonKey(name: 'day') this.day = 0,
      @JsonKey(name: 'month') this.month = 0});

  factory _$HolidayModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HolidayModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'day')
  final int day;
  @override
  @JsonKey(name: 'month')
  final int month;

  @override
  String toString() {
    return 'HolidayModel(id: $id, title: $title, day: $day, month: $month)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HolidayModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.month, month) || other.month == month));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, day, month);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HolidayModelImplCopyWith<_$HolidayModelImpl> get copyWith =>
      __$$HolidayModelImplCopyWithImpl<_$HolidayModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HolidayModelImplToJson(
      this,
    );
  }
}

abstract class _HolidayModel implements HolidayModel {
  factory _HolidayModel(
      {@JsonKey(name: '_id') final String id,
      @JsonKey(name: 'title') final String title,
      @JsonKey(name: 'day') final int day,
      @JsonKey(name: 'month') final int month}) = _$HolidayModelImpl;

  factory _HolidayModel.fromJson(Map<String, dynamic> json) =
      _$HolidayModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'day')
  int get day;
  @override
  @JsonKey(name: 'month')
  int get month;
  @override
  @JsonKey(ignore: true)
  _$$HolidayModelImplCopyWith<_$HolidayModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
