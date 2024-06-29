// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      id: json['id'] as String,
      title: json['text'] as String,
      isDone: json['done'] as bool,
      priority: $enumDecode(_$PriorityLevelEnumMap, json['importance']),
      date: const UnixDateTimeConverter()
          .fromJson((json['deadline'] as num?)?.toInt()),
      createdAt: (json['created_at'] as num?)?.toInt(),
      changedAt: (json['changed_at'] as num?)?.toInt(),
      deviceId: json['last_updated_by'] as String?,
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.title,
      'done': instance.isDone,
      'importance': _$PriorityLevelEnumMap[instance.priority]!,
      'deadline': const UnixDateTimeConverter().toJson(instance.date),
      'created_at': instance.createdAt,
      'changed_at': instance.changedAt,
      'last_updated_by': instance.deviceId,
    };

const _$PriorityLevelEnumMap = {
  PriorityLevel.low: 'low',
  PriorityLevel.basic: 'basic',
  PriorityLevel.important: 'important',
};
