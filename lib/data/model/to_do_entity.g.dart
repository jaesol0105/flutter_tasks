// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ToDoEntity _$ToDoEntityFromJson(Map<String, dynamic> json) => _ToDoEntity(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  isFavorite: json['is_favorite'] as bool,
  isDone: json['is_done'] as bool,
  createdAt: _convertToDateTime(json['created_at']),
  due: json['due'] == null ? null : DateTime.parse(json['due'] as String),
);

Map<String, dynamic> _$ToDoEntityToJson(_ToDoEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'is_favorite': instance.isFavorite,
      'is_done': instance.isDone,
      'created_at': _convertToTimestamp(instance.createdAt),
      'due': instance.due?.toIso8601String(),
    };
