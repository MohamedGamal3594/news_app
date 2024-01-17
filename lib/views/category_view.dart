import 'package:flutter/material.dart';
import 'package:news_api_app/widgets/news_grid_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    super.key,
    required this.category,
  });
  final String category;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(category),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: CustomScrollView(
        slivers: [
          NewsGridViewBuilder(
            width: width,
            category: category,
          ),
        ],
      ),
    );
  }
}
