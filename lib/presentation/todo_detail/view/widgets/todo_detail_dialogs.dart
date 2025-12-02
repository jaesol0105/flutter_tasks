import 'package:flutter/material.dart';
import 'package:tasks/application/enums/action_enums.dart';

/// todo_detail_page 관련 다이얼로그 및 스낵바
class TodoDetailDialogs {
  /// 경고 스낵바 출력
  static void showErrorSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  /// todo 저장 경고 대화상자 출력
  static Future<LeaveAction?> showLeaveDialog(BuildContext context) async {
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

  /// todo 삭제 경고 대화상자 출력
  static Future<bool> showDeleteDialog(BuildContext context) async {
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
}
