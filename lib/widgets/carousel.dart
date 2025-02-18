import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_cubit/Manager/cubit.dart';
import 'package:news_app_with_cubit/Manager/state.dart';
import 'package:news_app_with_cubit/models/articleModel.dart';

class CarouselNewsWidget extends StatelessWidget {
  const CarouselNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is LoadedState) {
          List<Articlemodel> articles = state.x;

          return CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
            ),
            items: articles.map((article) {
              Widget imageWidget = article.urlToImage != null
                  ? Image.network(
                      article.urlToImage!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Icon(
                      Icons.image_not_supported,
                      size: 100,
                      color: Colors.grey,
                    );

              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        children: [
                          imageWidget,
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Container(
                              color: Colors.black.withOpacity(0.5),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                article.title ?? "No Title",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        } else if (state is ErrorState) {
          return Center(child: Text("Error: ${state.ErrorMessage}"));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
