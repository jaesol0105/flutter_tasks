import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tasks/presentation/home/view/home_page.dart';

void main() {
  testWidgets('HomePage smoke test', (WidgetTester tester) async {
    // 1. ProviderScope로 감싸기 (Riverpod 필수)
    await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: HomePage())));

    // 2. 간단한 위젯 존재 여부만 확인 (원하는 대로 수정)
    expect(find.byType(HomePage), findsOneWidget);
  });
}
