import 'package:madagascar_workcoode/domain/model/article.dart';
import 'package:madagascar_workcoode/domain/model/work_code.dart';

abstract class WorkCodeRepository {
  Future<WorkCode> getWWorkCode();

  Future<List<Article>> searchArticle(String word);
}
