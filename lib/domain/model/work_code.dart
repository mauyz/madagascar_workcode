import 'package:madagascar_workcoode/domain/model/headline.dart';

class WorkCode {
  final String introduction;
  final List<Headline> headlines;

  WorkCode({
    required this.introduction,
    required this.headlines,
  });

  WorkCode.fromJson(Map<String, dynamic> json)
      : introduction = json["introduction"] as String,
        headlines = (json["headlines"] as List<dynamic>)
            .map(
              (e) => Headline.fromJson(e),
            )
            .toList();
}
