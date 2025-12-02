import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasks/application/enums/action_enums.dart';
import 'package:tasks/application/utils/debouncer.dart';
import 'package:tasks/domain/entities/todo_entity.dart';
import 'package:tasks/presentation/home/view_model/home_page_view_model.dart';
import 'package:tasks/presentation/todo_detail/view/widgets/todo_detail_dialogs.dart';
import 'package:tasks/presentation/todo_detail/view/widgets/todo_detail_view.dart';
import 'package:tasks/presentation/todo_detail/view_model/todo_detail_view_model.dart';

class TodoDetailPage extends HookConsumerWidget {
  const TodoDetailPage({super.key, required this.todo});

  static const String path = '/todo';
  final TodoEntity todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController(text: todo.title);
    final detailController = useTextEditingController(text: todo.description ?? "");

    // ViewModel 상태 (비즈니스 로직)
    final state = ref.watch(todoDetailViewModelProvider(todo));

    /// 변경 여부 체크
    void checkIfEdited() {
      ref
          .read(todoDetailViewModelProvider(todo).notifier)
          .checkIfEdited(title: titleController.text, description: detailController.text);
    }

    /// 디바운서 설정
    final debouncer = useMemoized(
      () => Debouncer(duration: const Duration(milliseconds: 300), callback: checkIfEdited),
    );

    /// textController 리스너 연결
    useEffect(() {
      void debouncedCheck() => debouncer.run();
      // 변경 사항 체크 - 디바운싱 적용
      titleController.addListener(debouncedCheck);
      detailController.addListener(debouncedCheck);
      return () {
        debouncer.dispose();
      };
    }, []);

    /// todo 마감일 설정
    Future<void> pickDeadLine() async {
      final now = DateTime.now();

      // DatePicker
      final pickedDate = await showDatePicker(
        context: context,
        initialDate: state.deadLine ?? now,
        firstDate: now,
        lastDate: DateTime(now.year + 5),
      );
      if (pickedDate == null) return;

      // TimePicker
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(
          hour: state.deadLine?.hour ?? now.hour,
          minute: state.deadLine?.minute ?? now.minute,
        ),
      );
      if (pickedTime == null) return;

      final picked = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      ref.read(todoDetailViewModelProvider(todo).notifier).setDeadLine(picked);
      checkIfEdited();
    }

    /// todo 변경 사항 반영하고 화면 나가기
    Future<void> saveAndPop() async {
      try {
        await ref
            .read(todoDetailViewModelProvider(todo).notifier)
            .saveTodo(title: titleController.text, description: detailController.text);
        if (context.mounted) Navigator.pop(context);
        // 예외 전파 - 스낵바를 통해 사용자에게 표시
      } catch (e) {
        if (context.mounted) {
          TodoDetailDialogs.showErrorSnackBar(context, '저장에 실패했습니다: $e');
        }
      }
    }

    /// todo 삭제 후 나가기
    Future<void> deleteAndPop() async {
      final result = await TodoDetailDialogs.showDeleteDialog(context);
      if (!result) return;
      try {
        await ref.read(todoDetailViewModelProvider(todo).notifier).deleteTodo();
        if (context.mounted) Navigator.pop(context);
        // 예외 전파 - 스낵바를 통해 사용자에게 표시
      } catch (e) {
        if (context.mounted) {
          TodoDetailDialogs.showErrorSnackBar(context, '삭제에 실패했습니다: $e');
        }
      }
    }

    /// 그냥 화면 나가기
    void discardAndPop() {
      Navigator.pop(context);
    }

    return PopScope(
      // 뒤로 가기 처리
      canPop: !state.isEdited, // 변경 없으면 true, 변경 있으면 false
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (titleController.text.isEmpty) {
          // 제목이 비어있으면 스낵바 출력
          TodoDetailDialogs.showErrorSnackBar(context, '제목을 입력해주세요.');
          return;
        }

        LeaveAction? action = await TodoDetailDialogs.showLeaveDialog(context);
        switch (action) {
          case LeaveAction.save:
            await saveAndPop();
            break;
          case LeaveAction.discard:
            discardAndPop();
            break;
          case LeaveAction.cancel:
          case null:
            break;
        }
      },

      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          actions: [
            IconButton(icon: const Icon(Icons.delete), onPressed: deleteAndPop),
            IconButton(
              icon: state.isFavorite ? const Icon(Icons.star) : const Icon(Icons.star_border),
              onPressed: () {
                ref.read(todoDetailViewModelProvider(todo).notifier).toggleFavorite();
                checkIfEdited();
              },
            ),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: TodoDetailView(
              titleController: titleController,
              detailController: detailController,
              deadLine: state.deadLine,
              onPickDue: pickDeadLine,
              onClearDue: () {
                ref.read(todoDetailViewModelProvider(todo).notifier).clearDeadLine();
                checkIfEdited();
              },
            ),
          ),
        ),
      ),
    );
  }
}
