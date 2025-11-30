import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_entity.freezed.dart';

@freezed
abstract class TodoEntity with _$TodoEntity {
  const factory TodoEntity({
    required String id,
    required String title,
    String? description,
    required bool isFavorite,
    required bool isDone,
    DateTime? createdAt,
    DateTime? deadLine,
  }) = _TodoEntity;
}
