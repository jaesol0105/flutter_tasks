import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasks/data/model/to_do_entity.dart';
import 'package:tasks/ui/home/viewmodel/home_page_view_model.dart';
import 'package:tasks/ui/tododetail/view/to_do_detail_page.dart';

class ToDoView extends ConsumerWidget {
  /// todo item 뷰
  const ToDoView({super.key, required this.toDo});

  final ToDoEntity toDo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ToDoDetailPage(toDo: toDo))),
        child: Container(
          color: Colors.transparent, // Spacer 부분에도 터치 가능하게 한다
          child: Row(
            children: [
              IconButton(
                onPressed: () => ref.read(homePageViewModelProvider.notifier).toggleDone(toDo.id),
                icon: Icon(toDo.isDone ? Icons.check_circle : Icons.circle_outlined),
              ),
              SizedBox(width: 12),
              Text(
                toDo.title,
                style: TextStyle(decoration: toDo.isDone ? TextDecoration.lineThrough : null, decorationThickness: 2),
              ),
              Spacer(),
              IconButton(
                onPressed: () => ref.read(homePageViewModelProvider.notifier).toggleFavorite(toDo.id),
                icon: Icon(toDo.isFavorite ? Icons.star : Icons.star_border),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
