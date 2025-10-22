import 'package:flutter/material.dart';
import 'package:tasks/models/to_do_entity.dart';
import 'package:tasks/pages/home/widgets/add_to_do_bottom_sheet_view.dart';
import 'package:tasks/pages/home/widgets/empty_view.dart';
import 'package:tasks/pages/home/widgets/to_do_list_view.dart';
import 'package:tasks/pages/tododetail/to_do_detail_page.dart';

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
          ? EmptyView(title: title)
          : ToDoListView(
              key: UniqueKey(),
              toDoList: todoList,
              onToggleDone: toggleDone,
              onToggleFavorite: toggleFavorite,
              onNavigateToDetail: navigateToDetail,
              onToDoDelete: toDoDelete,
              onToDoReInsert: toDoReInsert,
            ),

      // FAB - 새 TODO 추가
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return AddToDoBottomSheetView(onSave: saveToDo);
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
    });
  }

  /// [TODO 북마크 토글]
  void toggleFavorite(int index) {
    setState(() {
      todoList[index].isFavorite = !todoList[index].isFavorite;
    });
  }

  /// [TODO 완료 토글]
  void toggleDone(int index) {
    setState(() {
      todoList[index].isDone = !todoList[index].isDone;
    });
  }

  /// [TODO 삭제]
  ToDoEntity toDoDelete(int index) {
    final removedItem = todoList[index];
    setState(() {
      todoList.removeAt(index);
    });
    return removedItem;
  }

  // [TODO 삭제 되돌리기]
  void toDoReInsert(int index, ToDoEntity item) {
    setState(() {
      todoList.insert(index, item);
    });
  }

  /// [TODO 상세 페이지로 이동]
  Future<void> navigateToDetail(int index) async {
    // result 값 넘겨 받기
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ToDoDetailPage(
          key: UniqueKey(),
          toDo: todoList[index],
          index: index,
        ),
      ),
    );
    // result 값이 null이 아닐 경우 변경사항 반영
    if (result != null) {
      setState(() => todoList[index] = result);
    }
    // 빈 TODO 넘겨 받았을 경우 삭제 처리
    if (result != null && result.title.isEmpty) {
      toDoDelete(index);
    }
  }
}
