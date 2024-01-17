import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_api_app/models/article_model.dart';
import 'package:news_api_app/services/news_service.dart';
import 'package:news_api_app/widgets/news_grid_view.dart';

class NewsGridViewBuilder extends StatefulWidget {
  const NewsGridViewBuilder({
    super.key,
    required this.width,
    required this.category,
  });

  final double width;
  final String category;
  @override
  State<NewsGridViewBuilder> createState() => _NewsGridViewBuilderState();
}

class _NewsGridViewBuilderState extends State<NewsGridViewBuilder> {
  Future<List<ArticleModel>>? future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsGridView(
            width: widget.width,
            articles: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const SliverFillRemaining(
            child: Center(child: Text('oops there was an error, try later')),
          );
        } else {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
