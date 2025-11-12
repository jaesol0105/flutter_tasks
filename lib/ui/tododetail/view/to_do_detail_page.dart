import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasks/data/model/to_do_entity.dart';
import 'package:tasks/constants/action_enums.dart';
import 'package:tasks/ui/home/viewmodel/home_page_view_model.dart';
import 'package:tasks/ui/tododetail/view/widgets/to_do_detail_view.dart';

/// 뷰에 로컬 함수가 너무 많은데 깔끔하게 줄일 수 있는 방법?

class ToDoDetailPage extends HookConsumerWidget {
  const ToDoDetailPage({super.key, required this.toDo});

  final ToDoEntity toDo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.read(homePageViewModelProvider.notifier);

    final titleController = useTextEditingController(text: toDo.title);
    final detailController = useTextEditingController(
      text: toDo.description ?? "",
    );

    final fav = useState<bool>(toDo.isFavorite); // 북마크 상태
    final due = useState<DateTime?>(toDo.due); // 마감일 상태
    final isEdit = useState<bool>(false); // 변경 여부

    /// [변경 여부 체크 - 제목/내용/북마크/마감일]
    void markEditIfChanged() {
      final changed =
          titleController.text != toDo.title ||
          detailController.text != (toDo.description ?? "") ||
          fav.value != toDo.isFavorite ||
          due.value != toDo.due;
      isEdit.value = changed;
    }

    // [textController 리스너 연결]
    useEffect(() {
      titleController.addListener(markEditIfChanged);
      detailController.addListener(markEditIfChanged);
    }, []);

    /// [경고 스낵바 출력]
    void showSnackBar(String text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            text,
            style: TextStyle(
              color: Colors.white, // 미리 정의된 색상 사용
            ),
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
    }

    /// [TODO 저장 경고 대화상자 출력]
    Future<LeaveAction?> showLeaveDialog(BuildContext context) async {
      final action = await showDialog<LeaveAction>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('변경사항이 있어요'),
          content: const Text('저장하고 나갈까요?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, LeaveAction.cancel),
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, LeaveAction.discard),
              child: const Text('저장 안 함'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, LeaveAction.save),
              child: const Text('저장'),
            ),
          ],
        ),
      );
      return action;
    }

    /// [TODO 삭제 경고 대화상자 출력]
    Future<bool> showDeleteDialog() async {
      final action = await showDialog<DeleteAction>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('할 일을 삭제할까요?'),
          content: const Text('삭제 후엔 복구할 수 없어요.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, DeleteAction.cancel),
              child: const Text('취소'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, DeleteAction.done),
              child: const Text('삭제'),
            ),
          ],
        ),
      );

      return action == DeleteAction.done;
    }

    /// [TODO 마감일 설정]
    Future<void> pickDue() async {
      final now = DateTime.now();

      // DatePicker
      final pickedDate = await showDatePicker(
        context: context,
        initialDate: due.value ?? now,
        firstDate: now,
        lastDate: DateTime(now.year + 5),
      );
      if (pickedDate == null) return;

      // TimePicker
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(
          hour: due.value?.hour ?? now.hour,
          minute: due.value?.minute ?? now.minute,
        ),
      );
      if (pickedTime == null) return;

      final dueDate = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      due.value = dueDate;
      markEditIfChanged();
    }

    /// [TODO 북마크 토글]
    void toggleFavorite() {
      fav.value = !fav.value;
      markEditIfChanged();
    }

    /// [TODO 변경 사항 반영하고 화면 나가기]
    Future<void> saveAndPop() async {
      final updated = toDo.copyWith(
        title: titleController.text,
        description: detailController.text.isEmpty
            ? null
            : detailController.text,
        isFavorite: fav.value,
        due: due.value,
      );

      await vm.updateToDo(updated);
      if (context.mounted) Navigator.pop(context);
    }

    /// [TODO 삭제 후 나가기]
    Future<void> deleteAndPop() async {
      final result = await showDeleteDialog();
      if (!result) return;

      await vm.deleteToDo(toDo.id);
      if (context.mounted) Navigator.pop(context);
    }

    /// [그냥 화면 나가기]
    void discardAndPop() {
      Navigator.pop(context);
    }

    return PopScope(
      // 뒤로 가기 처리
      canPop: !isEdit.value, // 변경 없으면 true, 변경 있으면 false
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (titleController.text.isEmpty) {
          // 제목이 비어있으면 스낵바 출력
          showSnackBar('제목을 입력해주세요.');
          return;
        }

        LeaveAction? action = await showLeaveDialog(context);
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
            IconButton(icon: Icon(Icons.delete), onPressed: deleteAndPop),
            IconButton(
              icon: fav.value ? Icon(Icons.star) : Icon(Icons.star_border),
              onPressed: toggleFavorite,
            ),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: ToDoDetailView(
              titleController: titleController,
              detailController: detailController,
              due: due.value,
              onPickDue: pickDue,
              onClearDue: () {
                due.value = null;
                markEditIfChanged();
              },
            ),
          ),
        ),
      ),
    );
  }
}
