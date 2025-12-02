import 'package:tasks/data/dto/todo_dto.dart';
import 'package:tasks/domain/entities/todo_entity.dart';

/// WeatherDTO와 WeatherEntity 간 변환 매퍼
class TodoMapper {
  /// TodoDTO를 TodoEntity로 변환
  static TodoEntity toDomain(TodoDTO dto) => TodoEntity(
    id: dto.id,
    title: dto.title,
    description: dto.description,
    isFavorite: dto.isFavorite,
    isDone: dto.isDone,
    createdAt: dto.createdAt,
    deadLine: dto.deadLine,
  );

  /// TodoEntity를 TodoDTO로 변환
  static TodoDTO toDTO(TodoEntity entity) => TodoDTO(
    id: entity.id,
    title: entity.title,
    description: entity.description,
    isFavorite: entity.isFavorite,
    isDone: entity.isDone,
    createdAt: entity.createdAt,
    deadLine: entity.deadLine,
  );
}
