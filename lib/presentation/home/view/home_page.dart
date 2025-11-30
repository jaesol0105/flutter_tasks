import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:tasks/data/model/to_do_entity.dart';
import 'package:tasks/presentation/home/view/widgets/add_to_do_bottom_sheet_view.dart';
import 'package:tasks/presentation/home/view/widgets/empty_view.dart';
import 'package:tasks/presentation/home/view/widgets/to_do_view.dart';
import 'package:tasks/presentation/home/view/widgets/weather_bottom_view.dart';

import 'package:tasks/presentation/home/view_model/home_page_view_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  final title = "재솔's Tasks";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homePageViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),

      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('목록을 불러올 수 없습니다.\n$err')),
        data: (toDoList) => toDoList.isEmpty
            ? EmptyView(title: title)
            : ListView.separated(
                padding: EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 80),
                separatorBuilder: (BuildContext context, int index) => SizedBox(height: 0),
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
                      final removedItem = await ref
                          .read(homePageViewModelProvider.notifier)
                          .deleteToDo(item.id);

                      // 되돌리기 스낵바
                      messenger.showSnackBar(
                        SnackBar(
                          content: Text('${item.title} 삭제됨'),
                          action: SnackBarAction(
                            label: '되돌리기',
                            onPressed: () {
                              if (removedItem == null) return;
                              ref.read(homePageViewModelProvider.notifier).addToDo(removedItem);
                            },
                          ),
                        ),
                      );
                    },

                    // 아이템 뷰
                    child: ToDoView(toDo: item),
                  );
                },
              ),
      ),

      // 하단 네비게이션 - 날씨
      bottomNavigationBar: const WeatherBottomView(),

      // FAB - 새 todo 추가
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return AddToDoBottomSheetView();
            },
          );
        },
        backgroundColor: Colors.red,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 24),
      ),
    );
  }
}
