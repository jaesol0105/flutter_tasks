import 'package:flutter/material.dart';

class AddToDoBottomSheetView extends StatefulWidget {
  /// [새 TODO 추가하는 바텀시트 뷰]
  const AddToDoBottomSheetView({super.key, required this.onSave});

  /// [콜백 메소드]
  final void Function(
    String title,
    String? description,
    bool isFavorite,
    bool isDone,
  )
  onSave;

  @override
  State<AddToDoBottomSheetView> createState() => _AddToDoBottomSheetState();
}

class _AddToDoBottomSheetState extends State<AddToDoBottomSheetView> {
  final titleController = TextEditingController();
  final detailController = TextEditingController();

  bool showDetail = false;
  bool star = false;

  @override
  void dispose() {
    titleController.dispose();
    detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        12,
        20,
        MediaQuery.of(context).viewInsets.bottom,
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 타이틀 입력
          TextField(
            onChanged: (_) => setState(() {}),
            maxLines: 1,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => saveToDo(),
            autofocus: true,
            controller: titleController,
            decoration: InputDecoration(
              hintText: '새 할 일',
              hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
              border: InputBorder.none,
            ),
          ),

          // 세부정보 입력
          if (showDetail)
            TextField(
              maxLines: null,
              textInputAction: TextInputAction.newline,
              controller: detailController,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: '세부정보 추가',
                hintStyle: TextStyle(fontSize: 14),
                border: InputBorder.none,
              ),
            ),

          // 아이콘 메뉴
          Row(
            children: [
              // 세부정보 토글 버튼
              IconButton(
                onPressed: () => setState(() => showDetail = !showDetail),
                icon: Icon(
                  Icons.short_text_rounded,
                  color: Theme.of(context).dividerColor,
                  size: 24,
                ),
              ),
              SizedBox(width: 20),

              // 즐겨찾기 토글 버튼
              IconButton(
                onPressed: () => setState(() => star = !star),
                icon: Icon(
                  star ? Icons.star : Icons.star_border,
                  color: Theme.of(context).dividerColor,
                  size: 24,
                ),
              ),
              Spacer(),

              // 저장 버튼
              TextButton(
                onPressed: titleController.text.isNotEmpty ? saveToDo : null,
                child: Text(
                  '저장',
                  style: TextStyle(
                    color: titleController.text.isNotEmpty
                        ? Colors.pinkAccent
                        : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// [TODO 저장]
  void saveToDo() {
    final title = titleController.text.trim();
    final detail = showDetail ? detailController.text.trim() : null;
    if (titleController.text.isNotEmpty) {
      widget.onSave(title, detail, star, false);
      Navigator.of(context).pop();
    }
  }
}
