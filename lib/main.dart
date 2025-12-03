import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasks/application/config/firebase_options.dart';
import 'package:tasks/application/config/router.dart';
import 'package:tasks/application/config/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // runApp 전에 비동기 함수 사용해서 데이터 초기화할 때 추가해줘야 함
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); // 파이어 베이스
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      supportedLocales: const [Locale('ko', 'KR'), Locale('en', 'US')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,

      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
