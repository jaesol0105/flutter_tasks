import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasks/domain/entities/todo_entity.dart';
import 'package:tasks/presentation/home/view_model/home_page_view_model.dart';
import 'package:tasks/presentation/todo_detail/view/todo_detail_page.dart';

class TodoView extends ConsumerWidget {
  /// todo item 뷰
  const TodoView({super.key, required this.todo});

  final TodoEntity todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TodoDetailPage(todo: todo)),
        ),
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
