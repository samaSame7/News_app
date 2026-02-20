import 'package:flutter/material.dart';
import 'package:news_7/models/app_category.dart';
import 'package:news_7/ui/screens/categories_screen/categories_screen.dart';
import 'package:news_7/ui/screens/news_screen/news_screen.dart';

abstract final class AppRoutes {
  static Route newsScreen(AppCategory category) =>
      MaterialPageRoute(builder: (_) => NewsScreen(category));

  static Route get categoriesScreen =>
      MaterialPageRoute(builder: (_) => CategoriesScreen());
}
