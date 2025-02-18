import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_cubit/Manager/cubit.dart';
import 'package:news_app_with_cubit/models/categoryModel.dart';
import 'package:news_app_with_cubit/screens/categoryPage.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.category});
  final CatgoryModel category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: GestureDetector(
        onTap: () {
          context.read<AppCubit>().getNews(category: category.title);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CategoryView(
              category: category.title,
            );
          }));
        },
        child: Stack(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(category.imageUrl),
              radius: 55,
            ),
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.black.withOpacity(0.3),
              child: Center(
                  child: Text(
                category.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
