import 'package:flutter/material.dart';
import 'package:tasks/models/to_do_entity.dart';
import 'package:tasks/pages/home/widgets/empty_view.dart';
import 'package:tasks/pages/home/widgets/to_do_list_view.dart';

class HomePage extends StatelessWidget {
  final textController = TextEditingController();
  List<ToDoEntity> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "재솔's Tasks",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: todoList.isEmpty ? EmptyView() : ToDoListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 추가
        },
        backgroundColor: Colors.red,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
