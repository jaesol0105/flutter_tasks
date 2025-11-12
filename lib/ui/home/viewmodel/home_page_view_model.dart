import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasks/data/model/to_do_entity.dart';
import 'package:tasks/data/repository/to_do_repository.dart';
import 'package:tasks/data/repository/to_do_repository_impl.dart';

part 'home_page_view_model.g.dart';

@riverpod
class HomePageViewModel extends _$HomePageViewModel {
  ToDoRepository get repo => ref.read(toDoRepositoryProvider);

  @override
  Future<List<ToDoEntity>> build() async {
    return await repo.getToDos();
  }

  /// [TODO 목록을 불러와 상태를 갱신]
  Future<void> reload() async {
    // state = const AsyncLoading();
    try {
      final repo = ref.read(toDoRepositoryProvider);
      final list = await repo.getToDos();
      state = AsyncData(list);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  /// [TODO 추가]
  Future<void> addToDo(ToDoEntity todo) async {
    await repo.addToDo(todo);
    await reload();
  }

  /// [TODO 북마크 토글]
  Future<void> toggleFavorite(String? id) async {
    final current = state.value;
    if (current == null) return;

    final target = current.firstWhere(
      (e) => e.id == id,
      orElse: () => throw Exception('home_vm:toggleFavorite'),
    );

    final updated = target.copyWith(isFavorite: !target.isFavorite);

    await repo.updateToDo(updated);
    await reload();
  }

  /// [TODO 완료 토글]
  Future<void> toggleDone(String id) async {
    final current = state.value;
    if (current == null) return;

    final target = current.firstWhere(
      (e) => e.id == id,
      orElse: () => throw Exception('home_vm:toggleDone'),
    );

    final updated = target.copyWith(isDone: !target.isDone);

    await repo.updateToDo(updated);
    await reload();
  }

  /// [TODO 삭제]
  Future<ToDoEntity?> deleteToDo(String id) async {
    final current = state.value;
    if (current == null) return null;

    final target = current.firstWhere(
      (e) => e.id == id,
      orElse: () => throw Exception('home_vm:deleteToDo'),
    );

    await repo.deleteToDo(target.id);
    await reload();

    return target;
  }
}
