import 'package:flutter/material.dart';
import 'package:news_7/models/app_category.dart';
import 'package:news_7/ui/providers/theme_provider.dart';
import 'package:news_7/ui/screens/news_screen/tabs/news_tab/news_tab.dart';
import 'package:news_7/ui/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import '../news_search_screen/news_search_screen.dart';

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
      appBar: AppBar(
        title: Text(widget.category.name),
        actions: [buildSearch(), SizedBox(width: 16)],
      ),
      drawer: AppDrawer(),
      body: NewsTab(widget.category),
    );
  }

  Widget buildSearch() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NewsSearchScreen()),
        );
      },
      child: const Icon(Icons.search_outlined, size: 32),
    );
  }
}
