import 'package:tasks/data/data_sources/firestore_todo_data_source.dart';
import 'package:tasks/domain/entities/todo_entity.dart';
import 'package:tasks/domain/repositories/todo_repository.dart';
import 'package:tasks/data/mappers/todo_mapper.dart';

class TodoRepositoryImpl implements TodoRepository {
  /// TodoRepository 구현체 (DIP 준수)
  TodoRepositoryImpl({required this.dataSource});

  final FirestoreTodoDataSource dataSource;

  @override
  Future<TodoEntity> addTodo(TodoEntity entity) async {
    final dto = TodoMapper.toDTO(entity);
    final addedDto = await dataSource.addTodo(dto);
    return TodoMapper.toEntity(addedDto);
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
  Future<List<TodoEntity>> getTodos() async {
    final dtoList = await dataSource.getTodos();
    return dtoList.map((dto) => TodoMapper.toEntity(dto)).toList();
  }
}
