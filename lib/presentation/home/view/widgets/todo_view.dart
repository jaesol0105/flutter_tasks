import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasks/application/extensions/screen_ext.dart';
import 'package:tasks/domain/entities/todo_entity.dart';
import 'package:tasks/presentation/home/view_model/home_page_view_model.dart';
import 'package:tasks/presentation/providers/providers.dart';
import 'package:tasks/presentation/todo_detail/view/todo_detail_page.dart';

class TodoView extends ConsumerWidget {
  /// todo item 뷰
  const TodoView({super.key, required this.todo});

  final TodoEntity todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTodo = ref.watch(selectedTodoProvider); // [반응형 UI - 테블릿/폴드] 넓은 화면에서 현재 선택된 todo
    final isWideScreen = context.isWideScreen; // [반응형 UI - 테블릿/폴드] 기기 가로 길이
    final isSelected = selectedTodo?.id == todo.id;

    return Container(
      // [반응형 UI - 테블릿/폴드] 분할 화면일때 선택 여부에 따른 컨테이너 색상
      decoration: BoxDecoration(
        color: isSelected && isWideScreen
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        // [반응형 UI - 테블릿/폴드]
        onTap: () {
          if (isWideScreen) {
            // 넓은 화면 = 선택 상태 업데이트 (분할 뷰로 전환됨)
            ref.read(selectedTodoProvider.notifier).select(todo);
          } else {
            // 좁은 화면 = 상세 페이지로 라우팅
            context.push(TodoDetailPage.path, extra: todo);
          }
        },
        child: Container(
          color: Colors.transparent, // Spacer 부분에도 터치 가능하게 한다
          child: Row(
            children: [
              IconButton(
                onPressed: () => ref.read(homePageViewModelProvider.notifier).toggleDone(todo.id),
                icon: Icon(todo.isDone ? Icons.check_circle : Icons.circle_outlined),
              ),
              SizedBox(width: 12),
              Text(
                todo.title,
                style: TextStyle(
                  decoration: todo.isDone ? TextDecoration.lineThrough : null,
                  decorationThickness: 2,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () =>
                    ref.read(homePageViewModelProvider.notifier).toggleFavorite(todo.id),
                icon: Icon(todo.isFavorite ? Icons.star : Icons.star_border),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
