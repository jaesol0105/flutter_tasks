import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks/domain/entities/todo_entity.dart';
import 'package:tasks/presentation/home/view/home_page.dart';
import 'package:tasks/presentation/todo_detail/view/todo_detail_page.dart';

final router = GoRouter(
  initialLocation: HomePage.path,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        // 홈 페이지
        GoRoute(path: HomePage.path, name: 'home', builder: (context, state) => const HomePage()),

        // Todo 상세 페이지
        GoRoute(
          path: TodoDetailPage.path,
          name: 'todoDetail',
          builder: (context, state) {
            final todo = state.extra as TodoEntity;
            return TodoDetailPage(todo: todo);
          },
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) =>
      Scaffold(body: Center(child: Text('페이지를 찾을 수 없습니다: ${state.matchedLocation}'))),
);
