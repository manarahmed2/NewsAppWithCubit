class Articlemodel {
  final String title;
  final String? description;
  final String? urlToImage;
  final String url;

  Articlemodel({
    required this.url,
    required this.title,
    required this.description,
    required this.urlToImage,
  });

  factory Articlemodel.fromJson(Map<String, dynamic> json) {
    return Articlemodel(
      title: json['title'] ?? "No title",
      description: json['description'],
      urlToImage: json['urlToImage'],
      url: json['url'] ?? "",
    );
  }
}
