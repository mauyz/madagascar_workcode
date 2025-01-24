import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:madagascar_workcoode/domain/model/article.dart';
import 'package:madagascar_workcoode/domain/model/work_code.dart';

class JsonDataParser {
  static JsonDataParser? _instance;
  static WorkCode? _data;

  JsonDataParser._internal();

  static JsonDataParser get instance {
    return _instance ??= JsonDataParser._internal();
  }

  Future<WorkCode> parse() async {
    if (_data == null) {
      final jsonData = await rootBundle.loadString("assets/data.json");
      final map = jsonDecode(jsonData) as Map<String, dynamic>;
      _data = WorkCode.fromJson(map);
    }
    return Future.value(_data);
  }

  Future<List<Article>> search(String word) async {
    final articles = <Article>[];
    _data ??= await parse();
    for (final article in _data!.allArticles) {
      if (article.content.toLowerCase().contains(word.toLowerCase())) {
        articles.add(article);
      }
    }
    return articles;
  }

  Future<WorkCode> fix() async {
    if (_data == null) {
      final jsonData = await File("data.json").readAsString();
      final map = jsonDecode(jsonData) as Map<String, dynamic>;
      _data = WorkCode.fromJson(map);
    }
    return Future.value(_data);
  }

  Future persist() async {
    File newFile = File("data_1.json");
    final jsonData = jsonEncode(_data);
    await newFile.writeAsString(jsonData);
  }
}
