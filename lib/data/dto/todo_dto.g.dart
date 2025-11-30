// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodoDTO _$TodoDTOFromJson(Map<String, dynamic> json) => _TodoDTO(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  isFavorite: json['is_favorite'] as bool,
  isDone: json['is_done'] as bool,
  createdAt: TimestampConverter.toDateTime(json['created_at']),
  deadLine: TimestampConverter.toDateTime(json['dead_line']),
);

Map<String, dynamic> _$TodoDTOToJson(_TodoDTO instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'is_favorite': instance.isFavorite,
  'is_done': instance.isDone,
  'created_at': TimestampConverter.toTimestamp(instance.createdAt),
  'dead_line': TimestampConverter.toTimestamp(instance.deadLine),
};
