import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasks/application/config/dependencies.dart';
import 'package:tasks/domain/entities/todo_entity.dart';
import 'package:tasks/domain/repositories/todo_repository.dart';

part 'home_page_view_model.freezed.dart';
part 'home_page_view_model.g.dart';

/// TodoList 상태 관리 클래스
@freezed
abstract class TodoListState with _$TodoListState {
  const factory TodoListState({
    required List<TodoEntity> todos,
    @Default(true) bool hasMore, // 아직 안가져온 데이터가 서버에 있는지
    @Default(false) bool isLoadingMore, // 지금 추가 데이터를 로딩 중인지
  }) = _TodoListState;
}

@riverpod
class HomePageViewModel extends _$HomePageViewModel {
  TodoRepository get repo => ref.read(todoRepositoryProvider);

  static const int _pageSize = 15; // 페이지네이션 크기
  DateTime? _lastCreatedAt; // 현재 리스트의 마지막 요소의 생성일, 다음 스크롤의 기준으로 씀

  @override
  Future<TodoListState> build() async {
    final todos = await repo.getTodos(limit: _pageSize);
    _lastCreatedAt = todos.isNotEmpty ? todos.last.createdAt : null;

    return TodoListState(todos: todos, hasMore: todos.length >= _pageSize, isLoadingMore: false);
  }

  /// 무한 스크롤
  Future<void> loadMore() async {
    final currentState = state.value;
    if (currentState == null || !currentState.hasMore || currentState.isLoadingMore) {
      return;
    }
    // 로딩 상태 설정
    state = AsyncData(currentState.copyWith(isLoadingMore: true));

    try {
      final newTodos = await repo.getTodos(limit: _pageSize, lastCreatedAt: _lastCreatedAt);
      if (newTodos.isNotEmpty) {
        _lastCreatedAt = newTodos.last.createdAt;
      }
      state = AsyncData(
        TodoListState(
          todos: [...currentState.todos, ...newTodos],
          // 반환개수와 _pageSize가 일치할 경우 한번 더 새로고침 가능하게되지만 그냥 놔두기로함
          hasMore: newTodos.length >= _pageSize,
          isLoadingMore: false,
        ),
      );
      // 예외 처리
    } catch (e, stack) {
      log('ViewModel loadMore 실패: $e', error: e, stackTrace: stack);
      state = AsyncError(e, stack);
    }
  }

  /// Pull-to-Refresh
  Future<void> refresh() async {
    // 이미 리프레시 중이면 무시
    if (state.isLoading) return;

    _lastCreatedAt = null; // 처음부터 다시 로드
    state = const AsyncLoading(); // 로딩 상태로 전환

    try {
      final todos = await repo.getTodos(limit: _pageSize);
      _lastCreatedAt = todos.isNotEmpty ? todos.last.createdAt : null;
      state = AsyncData(
        TodoListState(todos: todos, hasMore: todos.length >= _pageSize, isLoadingMore: false),
      );
      // 예외 처리
    } catch (e, stack) {
      log('ViewModel refresh 실패: $e', error: e, stackTrace: stack);
      state = AsyncError(e, stack);
    }
  }

  /// todo 추가
  Future<void> addTodo(TodoEntity todo) async {
    final currentState = state.value;
    if (currentState == null) return;

    try {
      final created = await repo.addTodo(todo); // 문서 ID state에 반영
      state = AsyncData(currentState.copyWith(todos: [...currentState.todos, created]));
      // 예외 처리
    } catch (e, stack) {
      log('ViewModel addTodo 실패: $e', error: e, stackTrace: stack);
      state = AsyncError(e, stack);
    }
  }

  /// todo 수정
  Future<void> updateTodo(TodoEntity todo) async {
    final currentState = state.value;
    if (currentState == null) return;

    final list = currentState.todos;
    // UI 업데이트에 사용되는 로직이니까 뷰모델에 놔둠
    final idx = list.indexWhere((e) => e.id == todo.id);
    if (idx < 0) return;
    // 낙관적 업데이트
    state = AsyncData(currentState.copyWith(todos: [...list]..[idx] = todo));
    try {
      await repo.updateTodo(todo);
      // 예외 처리
    } catch (e, stack) {
      log('ViewModel updateTodo 실패: $e', error: e, stackTrace: stack);
      state = AsyncError(e, stack);
    }
  }

  /// todo 삭제
  Future<TodoEntity?> deleteTodo(String id) async {
    final currentState = state.value;
    if (currentState == null) return null;

    final list = currentState.todos;
    final idx = list.indexWhere((e) => e.id == id);
    if (idx < 0) return null;

    // 되돌리기를 위해 삭제 전 todo 백업
    final prev = list[idx];
    state = AsyncData(currentState.copyWith(todos: [...list]..removeAt(idx)));
    try {
      await repo.deleteTodo(id);
      // 예외 처리
    } catch (e, stack) {
      log('ViewModel deleteTodo 실패: $e', error: e, stackTrace: stack);
      state = AsyncError(e, stack);
    }
    return prev;
  }

  /// todo 북마크 토글
  Future<void> toggleFavorite(String id) async {
    final currentState = state.value;
    if (currentState == null) return;

    final list = currentState.todos;
    final idx = list.indexWhere((e) => e.id == id);
    if (idx < 0) return;

    final updated = list[idx].copyWith(isFavorite: !list[idx].isFavorite);
    state = AsyncData(currentState.copyWith(todos: [...list]..[idx] = updated));
    try {
      await repo.updateTodo(updated);
      // 예외 처리
    } catch (e, stack) {
      log('ViewModel toggleFavorite 실패: $e', error: e, stackTrace: stack);
      state = AsyncError(e, stack);
    }
  }

  /// todo 완료 토글
  Future<void> toggleDone(String id) async {
    final currentState = state.value;
    if (currentState == null) return;

    final list = currentState.todos;
    final idx = list.indexWhere((e) => e.id == id);
    if (idx < 0) return;

    final updated = list[idx].copyWith(isDone: !list[idx].isDone);
    state = AsyncData(currentState.copyWith(todos: [...list]..[idx] = updated));
    try {
      await repo.updateTodo(updated);
      // 예외 처리
    } catch (e, stack) {
      log('ViewModel toggleDone 실패: $e', error: e, stackTrace: stack);
      state = AsyncError(e, stack);
    }
  }
}
