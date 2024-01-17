import 'package:flutter/material.dart';
import 'package:news_api_app/widgets/categories_list_view.dart';
import 'package:news_api_app/widgets/news_grid_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'News Cloud',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: CategoriesListView()),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 5,
              ),
            ),
            NewsGridViewBuilder(
              width: width,
              category: 'general',
            ),
          ],
        ),
      ),
    );
  }
}
