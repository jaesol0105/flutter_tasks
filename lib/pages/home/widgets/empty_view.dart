import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  final String? title;

  EmptyView(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/add_to_do.webp',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 12),
          Text(
            '아직 할 일이 없음',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            '할 일을 추가하고 $title에서\n할 일을 추적하세요',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5, // 줄간격
            ),
          ),
        ],
      ),
    );
  }
}
