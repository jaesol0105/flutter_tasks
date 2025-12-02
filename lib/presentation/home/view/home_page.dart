import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:tasks/domain/entities/todo_entity.dart';
import 'package:tasks/presentation/home/view/widgets/add_todo_bottom_sheet_view.dart';
import 'package:tasks/presentation/home/view/widgets/empty_view.dart';
import 'package:tasks/presentation/home/view/widgets/todo_view.dart';
import 'package:tasks/presentation/home/view/widgets/weather_bottom_view.dart';

import 'package:tasks/presentation/home/view_model/home_page_view_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const path = '/';
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
        data: (todoListState) {
          final todos = todoListState.todos;

          if (todos.isEmpty) {
            return RefreshIndicator(
              onRefresh: () => ref.read(homePageViewModelProvider.notifier).refresh(),
              child: EmptyView(title: title),
            );
          }

          return RefreshIndicator(
            onRefresh: () => ref.read(homePageViewModelProvider.notifier).refresh(),
            child: ListView.separated(
              padding: EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 80),
              separatorBuilder: (BuildContext context, int index) => SizedBox(height: 0),
              itemCount: todos.length + (todoListState.hasMore ? 1 : 0), // 더 있으면 +1 (로딩 인디케이터)
              itemBuilder: (BuildContext context, int index) {
                // 마지막 아이템(로딩 인디케이터)일 경우
                if (index == todos.length) {
                  // 더 로드할 데이터가 있으면 loadMore 호출
                  if (!todoListState.isLoadingMore) {
                    // itemBuilder 빌드 끝난 후 실행 (build중 state 변경하면 안된다고 함)
                    Future.microtask(() {
                      ref.read(homePageViewModelProvider.notifier).loadMore();
                    });
                  }
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                TodoEntity item = todos[index];

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
                        .deleteTodo(item.id);

                    // 되돌리기 스낵바
                    messenger.showSnackBar(
                      SnackBar(
                        content: Text('${item.title} 삭제됨'),
                        action: SnackBarAction(
                          label: '되돌리기',
                          onPressed: () {
                            if (removedItem == null) return;
                            ref.read(homePageViewModelProvider.notifier).addTodo(removedItem);
                          },
                        ),
                      ),
                    );
                  },

                  // 아이템 뷰
                  child: TodoView(todo: item),
                );
              },
            ),
          );
        },
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
              return AddTodoBottomSheetView();
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
