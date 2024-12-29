// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyTaskModel _$MyTaskModelFromJson(Map<String, dynamic> json) {
  return _MyTaskModel.fromJson(json);
}

/// @nodoc
mixin _$MyTaskModel {
  @JsonKey(name: 'status')
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<TaskWork> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyTaskModelCopyWith<MyTaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyTaskModelCopyWith<$Res> {
  factory $MyTaskModelCopyWith(
          MyTaskModel value, $Res Function(MyTaskModel) then) =
      _$MyTaskModelCopyWithImpl<$Res, MyTaskModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') List<TaskWork> data});
}

/// @nodoc
class _$MyTaskModelCopyWithImpl<$Res, $Val extends MyTaskModel>
    implements $MyTaskModelCopyWith<$Res> {
  _$MyTaskModelCopyWithImpl(this._value, this._then);

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
              as List<TaskWork>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyTaskModelImplCopyWith<$Res>
    implements $MyTaskModelCopyWith<$Res> {
  factory _$$MyTaskModelImplCopyWith(
          _$MyTaskModelImpl value, $Res Function(_$MyTaskModelImpl) then) =
      __$$MyTaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') List<TaskWork> data});
}

/// @nodoc
class __$$MyTaskModelImplCopyWithImpl<$Res>
    extends _$MyTaskModelCopyWithImpl<$Res, _$MyTaskModelImpl>
    implements _$$MyTaskModelImplCopyWith<$Res> {
  __$$MyTaskModelImplCopyWithImpl(
      _$MyTaskModelImpl _value, $Res Function(_$MyTaskModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$MyTaskModelImpl(
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
              as List<TaskWork>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyTaskModelImpl implements _MyTaskModel {
  _$MyTaskModelImpl(
      {@JsonKey(name: 'status') this.status = false,
      @JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'data') final List<TaskWork> data = const []})
      : _data = data;

  factory _$MyTaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyTaskModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool status;
  @override
  @JsonKey(name: 'message')
  final String message;
  final List<TaskWork> _data;
  @override
  @JsonKey(name: 'data')
  List<TaskWork> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'MyTaskModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyTaskModelImpl &&
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
  _$$MyTaskModelImplCopyWith<_$MyTaskModelImpl> get copyWith =>
      __$$MyTaskModelImplCopyWithImpl<_$MyTaskModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyTaskModelImplToJson(
      this,
    );
  }
}

abstract class _MyTaskModel implements MyTaskModel {
  factory _MyTaskModel(
      {@JsonKey(name: 'status') final bool status,
      @JsonKey(name: 'message') final String message,
      @JsonKey(name: 'data') final List<TaskWork> data}) = _$MyTaskModelImpl;

  factory _MyTaskModel.fromJson(Map<String, dynamic> json) =
      _$MyTaskModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool get status;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'data')
  List<TaskWork> get data;
  @override
  @JsonKey(ignore: true)
  _$$MyTaskModelImplCopyWith<_$MyTaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskWork _$TaskWorkFromJson(Map<String, dynamic> json) {
  return _TaskWork.fromJson(json);
}

/// @nodoc
mixin _$TaskWork {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'taskId')
  TaskModel? get taskId => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed')
  bool get completed => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskWorkCopyWith<TaskWork> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskWorkCopyWith<$Res> {
  factory $TaskWorkCopyWith(TaskWork value, $Res Function(TaskWork) then) =
      _$TaskWorkCopyWithImpl<$Res, TaskWork>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'userId') String userId,
      @JsonKey(name: 'taskId') TaskModel? taskId,
      @JsonKey(name: 'completed') bool completed,
      @JsonKey(name: 'image') String image});

  $TaskModelCopyWith<$Res>? get taskId;
}

/// @nodoc
class _$TaskWorkCopyWithImpl<$Res, $Val extends TaskWork>
    implements $TaskWorkCopyWith<$Res> {
  _$TaskWorkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? taskId = freezed,
    Object? completed = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as TaskModel?,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskModelCopyWith<$Res>? get taskId {
    if (_value.taskId == null) {
      return null;
    }

    return $TaskModelCopyWith<$Res>(_value.taskId!, (value) {
      return _then(_value.copyWith(taskId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskWorkImplCopyWith<$Res>
    implements $TaskWorkCopyWith<$Res> {
  factory _$$TaskWorkImplCopyWith(
          _$TaskWorkImpl value, $Res Function(_$TaskWorkImpl) then) =
      __$$TaskWorkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'userId') String userId,
      @JsonKey(name: 'taskId') TaskModel? taskId,
      @JsonKey(name: 'completed') bool completed,
      @JsonKey(name: 'image') String image});

  @override
  $TaskModelCopyWith<$Res>? get taskId;
}

/// @nodoc
class __$$TaskWorkImplCopyWithImpl<$Res>
    extends _$TaskWorkCopyWithImpl<$Res, _$TaskWorkImpl>
    implements _$$TaskWorkImplCopyWith<$Res> {
  __$$TaskWorkImplCopyWithImpl(
      _$TaskWorkImpl _value, $Res Function(_$TaskWorkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? taskId = freezed,
    Object? completed = null,
    Object? image = null,
  }) {
    return _then(_$TaskWorkImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as TaskModel?,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskWorkImpl implements _TaskWork {
  _$TaskWorkImpl(
      {@JsonKey(name: '_id') this.id = '',
      @JsonKey(name: 'userId') this.userId = '',
      @JsonKey(name: 'taskId') this.taskId,
      @JsonKey(name: 'completed') this.completed = false,
      @JsonKey(name: 'image') this.image = ''});

  factory _$TaskWorkImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskWorkImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'userId')
  final String userId;
  @override
  @JsonKey(name: 'taskId')
  final TaskModel? taskId;
  @override
  @JsonKey(name: 'completed')
  final bool completed;
  @override
  @JsonKey(name: 'image')
  final String image;

  @override
  String toString() {
    return 'TaskWork(id: $id, userId: $userId, taskId: $taskId, completed: $completed, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskWorkImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, taskId, completed, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskWorkImplCopyWith<_$TaskWorkImpl> get copyWith =>
      __$$TaskWorkImplCopyWithImpl<_$TaskWorkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskWorkImplToJson(
      this,
    );
  }
}

abstract class _TaskWork implements TaskWork {
  factory _TaskWork(
      {@JsonKey(name: '_id') final String id,
      @JsonKey(name: 'userId') final String userId,
      @JsonKey(name: 'taskId') final TaskModel? taskId,
      @JsonKey(name: 'completed') final bool completed,
      @JsonKey(name: 'image') final String image}) = _$TaskWorkImpl;

  factory _TaskWork.fromJson(Map<String, dynamic> json) =
      _$TaskWorkImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'userId')
  String get userId;
  @override
  @JsonKey(name: 'taskId')
  TaskModel? get taskId;
  @override
  @JsonKey(name: 'completed')
  bool get completed;
  @override
  @JsonKey(name: 'image')
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$TaskWorkImplCopyWith<_$TaskWorkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
