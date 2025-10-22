import 'package:flutter/material.dart';
import 'package:tasks/models/to_do_entity.dart';
import 'package:tasks/constants/action_enums.dart';
import 'package:tasks/pages/tododetail/widgets/to_do_detail_view.dart';

class ToDoDetailPage extends StatefulWidget {
  const ToDoDetailPage({super.key, required this.toDo, required this.index});

  final ToDoEntity toDo;
  final int index;

  @override
  State<ToDoDetailPage> createState() => _ToDoDetailPageState();
}

class _ToDoDetailPageState extends State<ToDoDetailPage> {
  final titleController = TextEditingController();
  final detailController = TextEditingController();

  bool isEdit = false; // 변경 여부
  late bool fav; // 로컬 북마크 상태
  DateTime? due; // 로컬 마감일 상태

  @override
  void initState() {
    super.initState();
    titleController.text = widget.toDo.title;
    detailController.text = widget.toDo.description ?? "";
    fav = widget.toDo.isFavorite;
    due = widget.toDo.due;

    titleController.addListener(markEditIfChanged);
    detailController.addListener(markEditIfChanged);
  }

  @override
  void dispose() {
    titleController.dispose();
    detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // 뒤로 가기 처리
      canPop: !isEdit, // 변경 없으면 true, 변경 있으면 false
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
            saveAndPop();
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
            IconButton(icon: Icon(Icons.delete), onPressed: showDeleteDialog),
            IconButton(
              icon: fav ? Icon(Icons.star) : Icon(Icons.star_border),
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
              due: due,
              onPickDue: () => pickDeadline(due),
              onClearDue: () {
                setState(() => due = null);
                markEditIfChanged();
              },
            ),
          ),
        ),
      ),
    );
  }

  /// [저장 경고 대화상자 출력]
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

  /// [변경 여부 체크 - 제목/내용/북마크/마감일]
  void markEditIfChanged() {
    final changed =
        titleController.text != widget.toDo.title ||
        detailController.text != widget.toDo.description ||
        fav != widget.toDo.isFavorite ||
        due != widget.toDo.due;
    setState(() => isEdit = changed);
  }

  /// [TODO 북마크 토글]
  void toggleFavorite() {
    setState(() {
      fav = !fav;
    });
    markEditIfChanged();
  }

  /// [TODO 삭제]
  void showDeleteDialog() async {
    // 삭제 경고 대화상자 출력
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

    switch (action) {
      case DeleteAction.done:
        // 화면 종료 후 빈 TODO 반환, 부모에서 삭제 처리
        Navigator.pop(context, ToDoEntity('', null, false, false));
        break;
      case DeleteAction.cancel:
      case null:
        break;
    }
  }

  /// [TODO 마감일 설정]
  Future<void> pickDeadline(DateTime? now) async {
    now = now ?? DateTime.now();

    // DatePicker
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
    );
    if (pickedDate == null) return;

    // TimePicker
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
    );
    if (pickedTime == null) return;

    final dueDate = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    due = dueDate;
    markEditIfChanged();
  }

  /// [변경 사항 반영하고 화면 나가기]
  void saveAndPop() {
    widget.toDo.title = titleController.text;
    widget.toDo.description = detailController.text;
    widget.toDo.isFavorite = fav;
    widget.toDo.due = due;

    final updated = widget.toDo;
    Navigator.pop(context, updated); // 변경된 TODO 전달
  }

  /// [그냥 화면 나가기]
  void discardAndPop() {
    Navigator.pop(context); // 부모에서 null 체크 해서 변경사항 미반영
  }
}
