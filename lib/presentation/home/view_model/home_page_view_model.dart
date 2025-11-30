import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasks/data/dto/todo_dto.dart';
import 'package:tasks/domain/repositories/todo_repository.dart';
import 'package:tasks/data/repositories/to_do_repository_impl.dart';

part 'home_page_view_model.g.dart';

@riverpod
class HomePageViewModel extends _$HomePageViewModel {
  TodoRepository get repo => ref.read(toDoRepositoryProvider);

  @override
  Future<List<ToDoEntity>> build() async {
    return await repo.getTodos();
  }

  /// todo 추가
  Future<void> addToDo(ToDoEntity todo) async {
    final list = state.value;
    if (list == null) return;

    try {
      final created = await repo.addTodo(todo); // 문서 ID state에 반영 -> UUID로 바꿀까..
      state = AsyncData([...list, created]);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  /// todo 수정
  Future<void> updateToDo(ToDoEntity todo) async {
    final list = state.value;
    if (list == null) return;

    final idx = list.indexWhere((e) => e.id == todo.id);
    if (idx < 0) return;

    state = AsyncData([...list]..[idx] = todo);
    try {
      await repo.updateTodo(todo);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  /// todo 삭제
  Future<ToDoEntity?> deleteToDo(String id) async {
    final list = state.value;
    if (list == null) return null;

    final idx = list.indexWhere((e) => e.id == id);
    if (idx < 0) return null;

    // 되돌리기를 위해 삭제 전 todo 백업
    final prev = list[idx];
    state = AsyncData([...list]..removeAt(idx));
    try {
      await repo.deleteTodo(id);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
    return prev;
  }

  /// todo 북마크 토글
  Future<void> toggleFavorite(String id) async {
    final list = state.value;
    if (list == null) return;

    final idx = list.indexWhere((e) => e.id == id);
    if (idx < 0) return;

    final updated = list[idx].copyWith(isFavorite: !list[idx].isFavorite);
    state = AsyncData([...list]..[idx] = updated);
    try {
      await repo.updateTodo(updated);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  /// todo 완료 토글
  Future<void> toggleDone(String id) async {
    final list = state.value;
    if (list == null) return;

    final idx = list.indexWhere((e) => e.id == id);
    if (idx < 0) return;

    final updated = list[idx].copyWith(isDone: !list[idx].isDone);
    state = AsyncData([...list]..[idx] = updated);
    try {
      await repo.updateTodo(updated);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }
}
