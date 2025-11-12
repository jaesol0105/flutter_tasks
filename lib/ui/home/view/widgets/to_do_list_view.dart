import 'package:flutter/material.dart';
import 'package:tasks/data/model/to_do_entity.dart';
import 'package:tasks/ui/home/view/widgets/to_do_view.dart';

class ToDoListView extends StatelessWidget {
  /// [TODO 리스트 출력하는 뷰]
  const ToDoListView({
    super.key,
    required this.toDoList,
    required this.onToggleFavorite,
    required this.onToggleDone,
    required this.onNavigateToDetail,
    required this.onDeleteToDo,
    required this.onReInsertToDo,
  });

  final List<ToDoEntity> toDoList;
  final void Function(String) onToggleDone;
  final void Function(String) onToggleFavorite;
  final void Function(String) onNavigateToDetail;
  final Future<ToDoEntity?> Function(String) onDeleteToDo;
  final void Function(ToDoEntity) onReInsertToDo;

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
          key: ValueKey(item.id),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),

          onDismissed: (direction) async {
            final messenger = ScaffoldMessenger.of(context);
            final removedItem = await onDeleteToDo(item.id);

            // 되돌리기 스낵바
            messenger.showSnackBar(
              SnackBar(
                content: Text('${item.title} 삭제됨'),
                action: SnackBarAction(
                  label: '되돌리기',
                  onPressed: () {
                    if (removedItem == null) return;
                    onReInsertToDo(removedItem);
                  },
                ),
              ),
            );
          },

          // 아이템 뷰
          child: ToDoView(
            key: ValueKey(item.id),
            toDo: item,
            onToggleFavorite: () => onToggleFavorite(item.id),
            onToggleDone: () => onToggleDone(item.id),
            onNavigateToDetail: () => onNavigateToDetail(item.id),
          ),
        );
      },
    );
  }
}
