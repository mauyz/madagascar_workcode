class Article {
  final String title;
  final String content;

  Article({required this.title, required this.content});

  Article.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String,
        content = json['content'] as String;
}
