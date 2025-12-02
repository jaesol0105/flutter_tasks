import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {
  bool get isWideScreen => MediaQuery.of(this).size.shortestSide >= 600;
}
