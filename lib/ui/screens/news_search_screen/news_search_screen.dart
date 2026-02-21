import 'package:flutter/material.dart';
import 'package:news_7/ui/utils/extension/context_extension.dart';
import 'live_search_widget.dart';

class NewsSearchScreen extends StatefulWidget {
  const NewsSearchScreen({super.key});

  @override
  State<NewsSearchScreen> createState() => _NewsSearchScreenState();
}

class _NewsSearchScreenState extends State<NewsSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                style: TextStyle(color: context.secondaryColor),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search_outlined, size: 28),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close, size: 24),
                    onPressed: () {
                      if (_searchController.text.isEmpty) {
                        Navigator.pop(context);
                      } else {
                        _searchController.clear();
                        setState(() {
                          _searchQuery = "";
                        });
                      }
                    },
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.black54,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _searchQuery.isEmpty
                  ? const Center(child: Text("Search for news articles..."))
                  : LiveSearchWidget(searchQuery: _searchQuery),
            ),
          ],
        ),
      ),
    );
  }
}
