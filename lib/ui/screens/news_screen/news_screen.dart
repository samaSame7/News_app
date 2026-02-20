import 'package:flutter/material.dart';
import 'package:news_7/models/app_category.dart';
import 'package:news_7/ui/providers/theme_provider.dart';
import 'package:news_7/ui/screens/news_screen/tabs/news_tab/news_tab.dart';
import 'package:news_7/ui/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  final AppCategory category;
  const NewsScreen(this.category, {super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.category.name)),
      drawer: AppDrawer(),
      body: NewsTab(category: widget.category,),
    );
  }


}
