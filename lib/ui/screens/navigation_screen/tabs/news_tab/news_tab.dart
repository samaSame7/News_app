import 'package:flutter/material.dart';
import 'package:news_7/apis/api_manager.dart';
import 'package:news_7/models/source.dart';
import 'package:news_7/ui/screens/navigation_screen/tabs/news_tab/news_list.dart';
import 'package:news_7/ui/widgets/app_error.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.loadSources(),
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
