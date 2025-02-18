// import 'package:dio/dio.dart';
// import 'package:news_app/models/articleModel.dart';

// class ApiServices {
//   final Dio dio;
//   final String categoryName;

//   ApiServices({required this.categoryName, required this.dio});

//   Future<List<Articlemodel>> getNews({required String category}) async {
//     try {
//       Response response = await dio.get(
//         "https://newsapi.org/v2/top-headlines?country=us&apiKey=8840025c16be45269b99b02fe8e22baa&category=$category",
//       );

//       if (response.statusCode == 200) {
//         Map<String, dynamic> jsonData = response.data;
//         List<dynamic> articles = jsonData["articles"] ?? [];

//         return articles.map((article) {
//           return Articlemodel.fromJson(article);
//         }).toList();
//       } else {
//         throw Exception("Failed to fetch news");
//       }
//     } catch (e) {
//       throw Exception("Error: $e");
//     }
//   }
// }
import 'package:dio/dio.dart';

class Apiservices {
  final _baseUrl = "https://newsapi.org/";
  final dio = Dio();

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    Response response = await dio.get("$_baseUrl$endPoint");
    return response.data;
  }

  Future<Map<String, dynamic>> post({required String endPoint}) async {
    Response response = await dio.post("$_baseUrl$endPoint");
    return response.data;
  }
}
