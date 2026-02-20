import 'package:flutter/material.dart';
import 'package:news_7/ui/screens/navigation_screen/tabs/news_tab/news_list.dart';

class NewsTab extends StatelessWidget {
  const NewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: 3,
          child: TabBar(
            tabs: [
              Tab(child: Text("data")),
              Tab(child: Text("data")),
              Tab(child: Text("data")),
            ],
          ),
        ),
        Expanded(child: NewsList()),
      ],
    );
  }
}
