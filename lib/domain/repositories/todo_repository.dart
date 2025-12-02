import 'package:tasks/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  /// Todo 추가
  Future<TodoEntity> addTodo(TodoEntity todo);

  /// Todo 수정
  Future<void> updateTodo(TodoEntity todo);

  /// Todo 삭제
  Future<void> deleteTodo(String id);

  /// Todo 목록 조회
  Future<List<TodoEntity>> getTodos({required int limit, DateTime? lastCreatedAt});
}
