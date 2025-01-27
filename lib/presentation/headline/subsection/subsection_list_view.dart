import 'package:flutter/material.dart';
import 'package:madagascar_workcoode/domain/model/section.dart';
import 'package:madagascar_workcoode/presentation/headline/sectiion/section_card.dart';

class SectionListView extends StatelessWidget {
  final List<Section> sections;

  const SectionListView({
    super.key,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sections.length,
      itemBuilder: (_, index) {
        return SectionCard(
          section: sections[index],
        );
      },
    );
  }
}
