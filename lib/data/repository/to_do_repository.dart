import 'package:tasks/data/model/to_do_entity.dart';

abstract class ToDoRepository {
  Future<ToDoEntity> addToDo(ToDoEntity toDo);

  Future<void> updateToDo(ToDoEntity toDo);

  Future<void> deleteToDo(String id);

  Future<List<ToDoEntity>> getToDos();
}
