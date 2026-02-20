import 'package:flutter/material.dart';
import 'package:news_7/apis/api_manager.dart';
import 'package:news_7/models/article.dart';
import 'package:news_7/models/source.dart';
import 'package:news_7/ui/widgets/app_error.dart';

import 'news_widget.dart';

class NewsList extends StatelessWidget {
  final Source source;
  const NewsList({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.loadArticles(source.id!),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return AppError(message: snapshot.error.toString());
        } else if (snapshot.hasData) {
          List<Article> articles = snapshot.data!;
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return NewsWidget(article: articles[index]);
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
