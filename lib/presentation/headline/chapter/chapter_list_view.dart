import 'package:flutter/material.dart';
import 'package:madagascar_workcoode/domain/model/chapter.dart';
import 'package:madagascar_workcoode/presentation/headline/chapter/chapter_card.dart';

class ChapterListView extends StatelessWidget {
  final List<Chapter> chapters;

  const ChapterListView({
    super.key,
    required this.chapters,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: chapters.length,
      itemBuilder: (context, index) {
        return ChapterCard(
          chapter: chapters[index],
        );
      },
    );
  }
}
