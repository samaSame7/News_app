import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get primaryColor => Theme.of(this).primaryColor;
  TextTheme get textTheme => Theme.of(this).textTheme;
}
