import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:madagascar_workcoode/domain/model/work_code.dart';

class JsonParser {
  static JsonParser? _instance;
  static WorkCode? _data;

  JsonParser._internal();

  static JsonParser get instance {
    return _instance ??= JsonParser._internal();
  }

 Future<WorkCode> parseJson() async{
    if (_data == null) {
      final jsonData = await rootBundle.loadString("assets/data.json");
      final map = jsonDecode(jsonData) as Map<String, dynamic>;
      _data = WorkCode.fromJson(map);
    }
    return Future.value(_data);
  }

  Future<WorkCode> fixJson() async{
    if (_data == null) {
      final jsonData = await File("data.json").readAsString();
      final map = jsonDecode(jsonData) as Map<String, dynamic>;
      _data = WorkCode.fromJson(map);
    }
    return Future.value(_data);
  }

  Future persistJson() async {
    File newFile = File("data_1.json");
    final jsonData = jsonEncode(_data);
    await newFile.writeAsString(jsonData);
  }
}
