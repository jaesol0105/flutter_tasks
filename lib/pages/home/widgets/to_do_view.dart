import 'package:flutter/material.dart';
import 'package:tasks/models/to_do_entity.dart';

class ToDoView extends StatelessWidget {
  const ToDoView({
    super.key,
    required this.toDo,
    required this.onToggleFavorite,
    required this.onToggleDone,
  });
  final ToDoEntity toDo;
  final VoidCallback onToggleFavorite;
  final VoidCallback onToggleDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16),
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
    );
  }
}
