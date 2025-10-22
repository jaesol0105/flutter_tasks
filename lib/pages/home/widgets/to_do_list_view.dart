import 'package:flutter/material.dart';
import 'package:tasks/models/to_do_entity.dart';
import 'package:tasks/pages/home/widgets/to_do_view.dart';

class ToDoListView extends StatelessWidget {
  /// [TODO 리스트 출력하는 뷰]
  const ToDoListView({
    super.key,
    required this.toDoList,
    required this.onToggleFavorite,
    required this.onToggleDone,
    required this.onNavigateToDetail,
    required this.onToDoDelete,
    required this.onToDoReInsert,
  });

  final List<ToDoEntity> toDoList;
  final void Function(int) onToggleDone;
  final void Function(int) onToggleFavorite;
  final void Function(int) onNavigateToDetail;
  final ToDoEntity Function(int) onToDoDelete;
  final void Function(int, ToDoEntity) onToDoReInsert;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 80),
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 0),
      itemCount: toDoList.length,
      itemBuilder: (BuildContext context, int index) {
        ToDoEntity item = toDoList[index];

        // 아이템 밀어서 삭제하기
        return Dismissible(
          key: ValueKey(item),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (direction) {
            final removedItem = onToDoDelete(index);

            // 되돌리기 스낵바
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${item.title} 삭제됨'),
                action: SnackBarAction(
                  label: '되돌리기',
                  onPressed: () {
                    onToDoReInsert(index, removedItem);
                  },
                ),
              ),
            );
          },

          // 아이템 뷰
          child: ToDoView(
            key: UniqueKey(),
            toDo: item,
            onToggleFavorite: () => onToggleFavorite(index),
            onToggleDone: () => onToggleDone(index),
            onNavigateToDetail: () => onNavigateToDetail(index),
          ),
        );
      },
    );
  }
}
