import 'package:flutter/material.dart';
import 'package:news_7/models/article.dart';
import 'package:news_7/ui/utils/extension/context_extension.dart';
import 'package:news_7/ui/utils/extension/int_extension.dart';
import 'package:news_7/ui/widgets/article_bottom_sheet.dart';

class NewsWidget extends StatelessWidget {
  final Article article;
  const NewsWidget({super.key, required this.article});

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ArticleBottomSheet(article: article),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showBottomSheet(context),
      child: Container(
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: context.secondaryColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                article.urlToImage ?? "",
                height: MediaQuery.of(context).size.height * .2,
                fit: BoxFit.cover,
              ),
            ),
            12.verticalSpace(),
            Text(article.title ?? "", style: context.textTheme.bodyMedium),
            12.verticalSpace(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "By: ${article.author}",
                    style: context.textTheme.labelMedium,
                  ),
                ),
                10.horizontalSpace(),
                Text(
                  article.publishedAt ?? "",
                  style: context.textTheme.labelMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
