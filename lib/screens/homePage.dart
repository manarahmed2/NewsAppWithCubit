import 'package:flutter/material.dart';
import 'package:news_app_with_cubit/widgets/articleListView.dart';
import 'package:news_app_with_cubit/widgets/carousel.dart';
import 'package:news_app_with_cubit/widgets/categoryListView.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: const Text(
          'News App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CarouselNewsWidget(),
          ),
          SliverToBoxAdapter(
            child: CatgoryList(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "General News",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // هنا تم حذف category الممرر مباشرة وترك ArticlesListView لتحديد الفئة
          ArticlesListView(category: 'general'),
        ],
      ),
    );
  }
}
