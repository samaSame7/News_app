import 'package:flutter/material.dart';
import 'package:news_7/apis/api_manager.dart';
import 'package:news_7/models/app_category.dart';
import 'package:news_7/models/source.dart';
import 'package:news_7/ui/widgets/app_error.dart';

import 'news_list.dart';

class NewsTab extends StatefulWidget {
  final AppCategory category;
  const NewsTab({super.key, required this.category});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.loadSources(widget.category.name),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return AppError(message: snapshot.error.toString());
        } else if (snapshot.hasData) {
          return buildTabsList(snapshot.data!);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildTabsList(List<Source> sources) {
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: sources
                .map((source) => Tab(child: Text(source.name ?? "")))
                .toList(),
          ),
          Expanded(
            child: TabBarView(
              children: sources
                  .map((source) => NewsList(source: source))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
