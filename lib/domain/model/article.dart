import 'package:madagascar_workcoode/domain/model/tree_object.dart';

class Article extends TreeObject {
  final int number;
  final String title;
  final String content;

  Article({required this.number, required this.title, required this.content});

  Article.fromJson(Map<String, dynamic> json)
      : number = json["number"] as int,
        title = json['title'] as String,
        content = json['content'] as String;

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'title': title,
      'content': content,
    };
  }

  @override
  String getTreeTitle() {
    return title;
  }
}
