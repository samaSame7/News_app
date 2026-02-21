import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_7/apis/api_manager.dart';
import 'package:news_7/models/article.dart';
import 'package:news_7/ui/screens/news_screen/tabs/news_tab/news_widget.dart';
import 'package:news_7/ui/widgets/app_error.dart';

class LiveSearchWidget extends StatefulWidget {
  final String searchQuery;
  const LiveSearchWidget({super.key, required this.searchQuery});

  @override
  State<LiveSearchWidget> createState() => _LiveSearchWidgetState();
}

class _LiveSearchWidgetState extends State<LiveSearchWidget> {
  Timer? _debounce;
  Future<List<Article>>? _searchResults;

  @override
  void initState() {
    super.initState();
    _triggerSearch();
  }

  @override
  void didUpdateWidget(covariant LiveSearchWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchQuery != widget.searchQuery) {
      _triggerSearch();
    }
  }

  void _triggerSearch() {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (widget.searchQuery.trim().isNotEmpty) {
        setState(() {
          _searchResults = ApiManager.searchArticles(widget.searchQuery.trim());
        });
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_searchResults == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return FutureBuilder<List<Article>>(
      future: _searchResults,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return AppError(message: snapshot.error.toString());
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No articles found"));
        }

        List<Article> articles = snapshot.data!;
        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return NewsWidget(article: articles[index]);
          },
        );
      },
    );
  }
}
