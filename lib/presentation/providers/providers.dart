import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasks/domain/entities/todo_entity.dart';

part 'providers.g.dart';

/// [반응형 UI - 테블릿/폴드] 선택된 todo 상태 관리 프로바이더
@riverpod
class SelectedTodo extends _$SelectedTodo {
  @override
  TodoEntity? build() => null;

  void select(TodoEntity todo) => state = todo;
  void clear() => state = null;
}
