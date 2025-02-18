import 'package:flutter/material.dart';
import 'package:news_app_with_cubit/models/articleModel.dart';
import 'package:news_app_with_cubit/widgets/webView.dart';

class Articlewidget extends StatelessWidget {
  const Articlewidget({super.key, required this.articles});
  final Articlemodel articles;

  @override
  Widget build(BuildContext context) {
    String imageUrl = articles.urlToImage ?? 'assets/buisness.jpeg';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NewsView(newsUrl: articles.url),
              ));
            },
            child: Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: imageUrl.startsWith('http')
                      ? NetworkImage(imageUrl)
                      : AssetImage("assets/buisness.jpeg") as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            articles.title ?? "No title available",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            articles.description ?? "No description",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
