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
    final dto = TodoMapper.toDTO(entity);
    final addedDto = await dataSource.addTodo(dto);
    return TodoMapper.toDomain(addedDto);
  }

  @override
  Future<void> updateTodo(TodoEntity entity) async {
    final dto = TodoMapper.toDTO(entity);
    await dataSource.updateTodo(dto);
  }

  @override
  Future<void> deleteTodo(String id) async {
    await dataSource.deleteTodo(id);
  }

  @override
  Future<List<TodoEntity>> getTodos({required int limit, DateTime? lastCreatedAt}) async {
    final dtoList = await dataSource.getTodos(limit: limit, lastCreatedAt: lastCreatedAt);
    print('🌟${dtoList.length} 🌖${dtoList}'); // 무한 스크롤 로그
    return dtoList.map((dto) => TodoMapper.toDomain(dto)).toList();
  }
}
