import 'package:flutter/material.dart';
import 'package:news_api_app/models/article_model.dart';
import 'news_tile.dart';

class NewsGridView extends StatelessWidget {
  const NewsGridView({
    super.key,
    required this.width,
    required this.articles,
  });

  final double width;
  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: width > 900 ? width * 0.15 : 2,
      ),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return NewsTile(
              articleModel: articles[index],
            );
          },
          childCount: articles.length,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: width > 500 ? 2 : 1,
          childAspectRatio: 1.5,
          mainAxisSpacing: 30,
          crossAxisSpacing: 30,
        ),
      ),
    );
  }
}
