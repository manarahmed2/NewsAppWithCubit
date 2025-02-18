import 'package:flutter/material.dart';

import 'package:news_app_with_cubit/models/categoryModel.dart';
import 'package:news_app_with_cubit/widgets/category_widget.dart';

List<CatgoryModel> Catgories = [
  CatgoryModel(imageUrl: 'assets/health.jpeg', title: 'Health'),
  CatgoryModel(imageUrl: 'assets/buisness.jpeg', title: 'Business'),
  CatgoryModel(imageUrl: 'assets/technology.jpeg', title: 'Technology'),
  CatgoryModel(imageUrl: 'assets/entertainment.jpeg', title: 'Entertainment'),
  CatgoryModel(imageUrl: 'assets/science.jpeg', title: 'Science'),
  CatgoryModel(imageUrl: 'assets/sports.jpeg', title: 'Sports'),
];

class CatgoryList extends StatelessWidget {
  const CatgoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return CategoryWidget(
            category: Catgories[index],
          );
        },
        itemCount: Catgories.length,
      ),
    );
  }
}
