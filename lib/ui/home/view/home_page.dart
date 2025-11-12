import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:tasks/data/model/to_do_entity.dart';
import 'package:tasks/ui/home/view/widgets/add_to_do_bottom_sheet_view.dart';
import 'package:tasks/ui/home/view/widgets/empty_view.dart';
import 'package:tasks/ui/home/view/widgets/to_do_list_view.dart';
import 'package:tasks/ui/home/view/widgets/weather_bottom_view.dart';
import 'package:tasks/ui/tododetail/view/to_do_detail_page.dart';

import 'package:tasks/ui/home/viewmodel/home_page_view_model.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  final title = "재솔's Tasks";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homePageViewModelProvider);
    final vm = ref.read(homePageViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),

      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('목록을 불러올 수 없습니다.\n$err')),
        data: (todoList) {
          return todoList.isEmpty
              ? EmptyView(title: title)
              : ToDoListView(
                  key: UniqueKey(),
                  toDoList: todoList,
                  onToggleDone: (id) => vm.toggleDone(id),
                  onToggleFavorite: (id) => vm.toggleFavorite(id),
                  onNavigateToDetail: (todo) {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ToDoDetailPage(toDo: todo)));
                  },
                  onDeleteToDo: (id) => vm.deleteToDo(id),
                  onReInsertToDo: (todo) => vm.addToDo(todo),
                );
        },
      ),

      // 하단 네비게이션 - 날씨
      bottomNavigationBar: const WeatherBottomView(),

      // FAB - 새 TODO 추가
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return AddToDoBottomSheetView(
                onAddToDo: (title, description, isFavorite, isDone) => vm.addToDo(
                  ToDoEntity(id: '', title: title, description: description, isFavorite: isFavorite, isDone: isDone),
                ),
              );
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
