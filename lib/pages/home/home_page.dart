import 'package:flutter/material.dart';
import 'package:tasks/models/to_do_entity.dart';
import 'package:tasks/pages/home/widgets/add_to_do_bottom_sheet_view.dart';
import 'package:tasks/pages/home/widgets/empty_view.dart';
import 'package:tasks/pages/home/widgets/to_do_list_view.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final title = "재솔's Tasks";
  List<ToDoEntity> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),

      body: todoList.isEmpty
          ? EmptyView(title)
          : ToDoListView(
              key: UniqueKey(),
              toDoList: todoList,
              onToggleDone: toggleDone,
              onToggleFavorite: toggleFavorite,
            ),

      // [FAB - 새 TODO 추가]
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return AddToDoBottomSheetView(saveToDo);
            },
          );
        },
        backgroundColor: Colors.red,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 24),
      ),
    );
  }

  /// [새 TODO 추가]
  void saveToDo(
    String title,
    String? description,
    bool isFavorite,
    bool isDone,
  ) {
    setState(() {
      todoList.add(ToDoEntity(title, description, isFavorite, isDone));
      print(todoList);
    });
  }

  void toggleFavorite(int index) {
    setState(() {
      todoList[index].isFavorite = !todoList[index].isFavorite;
    });
  }

  void toggleDone(int index) {
    setState(() {
      todoList[index].isDone = !todoList[index].isDone;
    });
  }
}
