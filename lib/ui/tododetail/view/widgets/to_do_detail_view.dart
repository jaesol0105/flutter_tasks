import 'package:flutter/material.dart';

class ToDoDetailView extends StatelessWidget {
  const ToDoDetailView({
    super.key,
    required this.titleController,
    required this.detailController,
    required this.due,
    required this.onPickDue,
    required this.onClearDue,
  });

  final TextEditingController titleController;
  final TextEditingController detailController;
  final DateTime? due;
  final VoidCallback onPickDue;
  final VoidCallback onClearDue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 제목
        TextField(
          controller: titleController,
          decoration: const InputDecoration(labelText: '제목'),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        // 세부 내용
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 13),
              child: Icon(
                Icons.short_text_rounded,
                color: Theme.of(context).dividerColor,
                size: 30,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: TextField(
                  controller: detailController,
                  maxLines: null,
                  minLines: 1,
                  decoration: const InputDecoration(
                    hintText: '세부 내용을 입력하세요',
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),

        // 마감일
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Icon(
                Icons.schedule,
                color: Theme.of(context).dividerColor,
                size: 30,
              ),
            ),
            const SizedBox(width: 16),
            if (due != null)
              Container(
                decoration: ShapeDecoration(
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 6,
                    bottom: 6,
                    left: 18,
                    right: 12,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: onPickDue,
                        child: Text(
                          '${due!.year}년 ${due!.month}월 ${due!.day}일 (${['월', '화', '수', '목', '금', '토', '일'][due!.weekday - 1]})',
                          style: TextStyle(
                            color: Theme.of(context).dividerColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: onClearDue,
                          icon: Icon(
                            Icons.close,
                            color: Theme.of(context).dividerColor,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              GestureDetector(
                onTap: onPickDue,
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    '날짜/시간 추가',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
