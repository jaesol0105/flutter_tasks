import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasks/domain/entities/todo_entity.dart';
import 'package:tasks/presentation/home/view_model/home_page_view_model.dart';

part 'todo_detail_view_model.freezed.dart';
part 'todo_detail_view_model.g.dart';

/// todo_detail_page 변경사항 상태 클래스
@freezed
abstract class TodoDetailState with _$TodoDetailState {
  const factory TodoDetailState({
    required TodoEntity originalTodo,
    required bool isFavorite,
    required DateTime? deadLine,
    required bool isEdited,
  }) = _TodoDetailState;
}

@riverpod
class TodoDetailViewModel extends _$TodoDetailViewModel {
  @override
  TodoDetailState build(TodoEntity todo) {
    return TodoDetailState(
      originalTodo: todo,
      isFavorite: todo.isFavorite,
      deadLine: todo.deadLine,
      isEdited: false,
    );
  }

  /// 변경 여부 체크 - 제목/내용/북마크/마감일
  void checkIfEdited({required String title, required String description}) {
    final changed =
        title != state.originalTodo.title ||
        description != (state.originalTodo.description ?? "") ||
        state.isFavorite != state.originalTodo.isFavorite ||
        state.deadLine != state.originalTodo.deadLine;

    state = state.copyWith(isEdited: changed);
  }

  /// 북마크 토글
  void toggleFavorite() {
    state = state.copyWith(isFavorite: !state.isFavorite);
  }

  /// 마감일 설정
  void setDeadLine(DateTime deadLine) {
    state = state.copyWith(deadLine: deadLine);
  }

  /// 마감일 초기화
  void clearDeadLine() {
    state = state.copyWith(deadLine: null);
  }

  /// Todo 저장
  Future<void> saveTodo({required String title, required String description}) async {
    try {
      final updated = state.originalTodo.copyWith(
        title: title,
        description: description.isEmpty ? null : description,
        isFavorite: state.isFavorite,
        deadLine: state.deadLine,
      );

      await ref.read(homePageViewModelProvider.notifier).updateTodo(updated);
      // 예외 전파
    } catch (e, s) {
      log('DetailViewModel saveTodo 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  /// Todo 삭제
  Future<void> deleteTodo() async {
    try {
      await ref.read(homePageViewModelProvider.notifier).deleteTodo(state.originalTodo.id);
      // 예외 전파
    } catch (e, s) {
      log('DetailViewModel deleteTodo 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }
}
