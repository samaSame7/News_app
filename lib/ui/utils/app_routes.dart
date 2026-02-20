import 'package:flutter/material.dart';
import 'package:news_7/ui/screens/navigation_screen/navigation_screen.dart';

abstract final class AppRoutes {
  static Route get navigationScreen =>
      MaterialPageRoute(builder: (_) => NavigationScreen());
}
