import 'package:flutter/material.dart';
import 'package:tasks/models/to_do_entity.dart';
import 'package:tasks/pages/home/widgets/empty_view.dart';
import 'package:tasks/pages/home/widgets/to_do_list_view.dart';

class HomePage extends StatelessWidget {
  final textController = TextEditingController();
  final title = "재솔's Tasks";
  List<ToDoEntity> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: todoList.isEmpty ? EmptyView(title) : ToDoListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 추가
        },
        backgroundColor: Colors.red,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 24),
      ),
    );
  }
}
