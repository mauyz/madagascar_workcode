import 'package:madagascar_workcoode/data/datasource/json_parser.dart';
import 'package:madagascar_workcoode/domain/model/article.dart';
import 'package:madagascar_workcoode/domain/model/work_code.dart';
import 'package:madagascar_workcoode/domain/repository/work_code_repository.dart';

class WorkCodeRepositoryImpl implements WorkCodeRepository {
  final jsonParser = JsonParser.instance;

  @override
  Future<WorkCode> getWWorkCode() {
    return jsonParser.parseJson();
  }

  @override
  Future<List<Article>> searchArticle(String word) {
    return jsonParser.search(word);
  }
}
