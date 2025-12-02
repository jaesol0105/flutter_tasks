import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 페이지 이동 애니메이션 (우측 슬라이드)
class PageTransitions {
  static CustomTransitionPage slideTransition({
    required LocalKey key,
    required Widget child,
    Duration duration = const Duration(milliseconds: 150),
  }) {
    return CustomTransitionPage(
      key: key,
      child: child,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final inTween = Tween(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.fastOutSlowIn));

        final outTween = Tween(
          begin: Offset.zero,
          end: const Offset(1.0, 0.0),
        ).chain(CurveTween(curve: Curves.fastOutSlowIn));

        return SlideTransition(
          position: animation.drive(inTween),
          child: SlideTransition(position: secondaryAnimation.drive(outTween), child: child),
        );
      },
    );
  }
}
