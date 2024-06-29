// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      isDone: json['isDone'] as bool,
      priority: $enumDecode(_$PriorityLevelEnumMap, json['priority']),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isDone': instance.isDone,
      'priority': _$PriorityLevelEnumMap[instance.priority]!,
      'date': instance.date?.toIso8601String(),
    };

const _$PriorityLevelEnumMap = {
  PriorityLevel.none: 'none',
  PriorityLevel.medium: 'medium',
  PriorityLevel.heigh: 'heigh',
};
