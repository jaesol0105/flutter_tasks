import 'package:flutter/material.dart';
import 'package:tasks/models/to_do_entity.dart';
import 'package:tasks/pages/home/widgets/to_do_view.dart';

class ToDoListView extends StatelessWidget {
  ToDoListView({
    super.key,
    required this.toDoList,
    required this.onToggleFavorite,
    required this.onToggleDone,
  });

  final List<ToDoEntity> toDoList;
  final void Function(int) onToggleDone;
  final void Function(int) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 80),
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 0),
      itemCount: toDoList.length,
      itemBuilder: (BuildContext context, int index) {
        ToDoEntity item = toDoList[index];
        return ToDoView(
          key: UniqueKey(),
          toDo: item,
          onToggleFavorite: () => onToggleFavorite(index),
          onToggleDone: () => onToggleDone(index),
        );
      },
    );
  }
}
