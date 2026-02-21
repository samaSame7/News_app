import 'package:flutter/material.dart';
import 'package:news_7/models/article.dart';
import 'package:news_7/ui/utils/extension/context_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleBottomSheet extends StatelessWidget {
  final Article article;

  const ArticleBottomSheet({super.key, required this.article});

  Future<void> _launchUrl() async {
    if (article.url == null) return;
    final Uri url = Uri.parse(article.url!);
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.secondaryColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              article.urlToImage ?? "",
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Center(child: Icon(Icons.broken_image, size: 50)),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            article.content ?? article.description ?? "No content available.",
            style: context.textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _launchUrl,
            style: ElevatedButton.styleFrom(
              backgroundColor: context.primaryColor,
              foregroundColor: context.secondaryColor,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(
              "View Full Article",
              style: context.textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
