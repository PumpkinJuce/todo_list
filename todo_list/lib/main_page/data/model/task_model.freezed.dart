// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
mixin _$TaskModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'done')
  bool get isDone => throw _privateConstructorUsedError;
  @JsonKey(name: 'importance')
  PriorityLevel get priority => throw _privateConstructorUsedError;
  @UnixDateTimeConverter()
  @JsonKey(name: 'deadline')
  DateTime? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  int? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'changed_at')
  int? get changedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_updated_by')
  String? get deviceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'text') String title,
      @JsonKey(name: 'done') bool isDone,
      @JsonKey(name: 'importance') PriorityLevel priority,
      @UnixDateTimeConverter() @JsonKey(name: 'deadline') DateTime? date,
      @JsonKey(name: 'created_at') int? createdAt,
      @JsonKey(name: 'changed_at') int? changedAt,
      @JsonKey(name: 'last_updated_by') String? deviceId});
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isDone = null,
    Object? priority = null,
    Object? date = freezed,
    Object? createdAt = freezed,
    Object? changedAt = freezed,
    Object? deviceId = freezed,
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
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as PriorityLevel,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      changedAt: freezed == changedAt
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskModelImplCopyWith<$Res>
    implements $TaskModelCopyWith<$Res> {
  factory _$$TaskModelImplCopyWith(
          _$TaskModelImpl value, $Res Function(_$TaskModelImpl) then) =
      __$$TaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'text') String title,
      @JsonKey(name: 'done') bool isDone,
      @JsonKey(name: 'importance') PriorityLevel priority,
      @UnixDateTimeConverter() @JsonKey(name: 'deadline') DateTime? date,
      @JsonKey(name: 'created_at') int? createdAt,
      @JsonKey(name: 'changed_at') int? changedAt,
      @JsonKey(name: 'last_updated_by') String? deviceId});
}

/// @nodoc
class __$$TaskModelImplCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$TaskModelImpl>
    implements _$$TaskModelImplCopyWith<$Res> {
  __$$TaskModelImplCopyWithImpl(
      _$TaskModelImpl _value, $Res Function(_$TaskModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isDone = null,
    Object? priority = null,
    Object? date = freezed,
    Object? createdAt = freezed,
    Object? changedAt = freezed,
    Object? deviceId = freezed,
  }) {
    return _then(_$TaskModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as PriorityLevel,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      changedAt: freezed == changedAt
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskModelImpl extends _TaskModel {
  const _$TaskModelImpl(
      {required this.id,
      @JsonKey(name: 'text') required this.title,
      @JsonKey(name: 'done') required this.isDone,
      @JsonKey(name: 'importance') required this.priority,
      @UnixDateTimeConverter() @JsonKey(name: 'deadline') this.date,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'changed_at') this.changedAt,
      @JsonKey(name: 'last_updated_by') this.deviceId})
      : super._();

  factory _$TaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'text')
  final String title;
  @override
  @JsonKey(name: 'done')
  final bool isDone;
  @override
  @JsonKey(name: 'importance')
  final PriorityLevel priority;
  @override
  @UnixDateTimeConverter()
  @JsonKey(name: 'deadline')
  final DateTime? date;
  @override
  @JsonKey(name: 'created_at')
  final int? createdAt;
  @override
  @JsonKey(name: 'changed_at')
  final int? changedAt;
  @override
  @JsonKey(name: 'last_updated_by')
  final String? deviceId;

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, isDone: $isDone, priority: $priority, date: $date, createdAt: $createdAt, changedAt: $changedAt, deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.changedAt, changedAt) ||
                other.changedAt == changedAt) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, isDone, priority,
      date, createdAt, changedAt, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      __$$TaskModelImplCopyWithImpl<_$TaskModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskModelImplToJson(
      this,
    );
  }
}

abstract class _TaskModel extends TaskModel {
  const factory _TaskModel(
      {required final String id,
      @JsonKey(name: 'text') required final String title,
      @JsonKey(name: 'done') required final bool isDone,
      @JsonKey(name: 'importance') required final PriorityLevel priority,
      @UnixDateTimeConverter() @JsonKey(name: 'deadline') final DateTime? date,
      @JsonKey(name: 'created_at') final int? createdAt,
      @JsonKey(name: 'changed_at') final int? changedAt,
      @JsonKey(name: 'last_updated_by')
      final String? deviceId}) = _$TaskModelImpl;
  const _TaskModel._() : super._();

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$TaskModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'text')
  String get title;
  @override
  @JsonKey(name: 'done')
  bool get isDone;
  @override
  @JsonKey(name: 'importance')
  PriorityLevel get priority;
  @override
  @UnixDateTimeConverter()
  @JsonKey(name: 'deadline')
  DateTime? get date;
  @override
  @JsonKey(name: 'created_at')
  int? get createdAt;
  @override
  @JsonKey(name: 'changed_at')
  int? get changedAt;
  @override
  @JsonKey(name: 'last_updated_by')
  String? get deviceId;
  @override
  @JsonKey(ignore: true)
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
