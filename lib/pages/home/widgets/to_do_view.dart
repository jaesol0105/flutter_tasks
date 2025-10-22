import 'package:flutter/material.dart';
import 'package:tasks/models/to_do_entity.dart';

class ToDoView extends StatelessWidget {
  /// [TODO 아이템 뷰]
  const ToDoView({
    super.key,
    required this.toDo,
    required this.onToggleFavorite,
    required this.onToggleDone,
    required this.onNavigateToDetail,
  });

  final ToDoEntity toDo;
  final VoidCallback onToggleFavorite;
  final VoidCallback onToggleDone;
  final VoidCallback onNavigateToDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: onNavigateToDetail,
        child: Container(
          color: Colors.transparent, // Spacer 부분에도 터치 가능하게 한다
          child: Row(
            children: [
              IconButton(
                onPressed: onToggleDone,
                icon: Icon(
                  toDo.isDone ? Icons.check_circle : Icons.circle_outlined,
                ),
              ),
              SizedBox(width: 12),
              Text(
                toDo.title,
                style: TextStyle(
                  decoration: toDo.isDone ? TextDecoration.lineThrough : null,
                  decorationThickness: 2,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: onToggleFavorite,
                icon: Icon(toDo.isFavorite ? Icons.star : Icons.star_border),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
