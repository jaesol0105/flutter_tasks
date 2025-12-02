import 'dart:developer';

import 'package:tasks/data/data_sources/firestore_todo_data_source.dart';
import 'package:tasks/domain/entities/todo_entity.dart';
import 'package:tasks/domain/repositories/todo_repository.dart';
import 'package:tasks/data/mappers/todo_mapper.dart';

class TodoRepositoryImpl implements TodoRepository {
  /// TodoRepository 구현체
  TodoRepositoryImpl({required this.dataSource});

  final FirestoreTodoDataSource dataSource;

  @override
  Future<TodoEntity> addTodo(TodoEntity entity) async {
    try {
      final dto = TodoMapper.toDTO(entity);
      final addedDto = await dataSource.addTodo(dto);
      return TodoMapper.toDomain(addedDto);
      // 예외 전파
    } catch (e, s) {
      log('Repository addTodo 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> updateTodo(TodoEntity entity) async {
    try {
      final dto = TodoMapper.toDTO(entity);
      await dataSource.updateTodo(dto);
      // 예외 전파
    } catch (e, s) {
      log('Repository updateTodo 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> deleteTodo(String id) async {
    try {
      await dataSource.deleteTodo(id);
      // 예외 전파
    } catch (e, s) {
      log('Repository deleteTodo 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<TodoEntity>> getTodos({required int limit, DateTime? lastCreatedAt}) async {
    try {
      final dtoList = await dataSource.getTodos(limit: limit, lastCreatedAt: lastCreatedAt);
      log('🌟${dtoList.length} 🌖${dtoList}'); // 무한 스크롤 확인 로그
      return dtoList.map((dto) => TodoMapper.toDomain(dto)).toList();
      // 예외 전파
    } catch (e, s) {
      log('Repository getTodos 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }
}
