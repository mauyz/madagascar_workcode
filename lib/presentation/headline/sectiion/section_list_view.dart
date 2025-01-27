import 'package:flutter/material.dart';
import 'package:madagascar_workcoode/domain/model/subsection.dart';
import 'package:madagascar_workcoode/presentation/headline/subsection/subsection_card.dart';

class SubsectionListView extends StatelessWidget {
  final List<Subsection> subsections;

  const SubsectionListView({
    super.key,
    required this.subsections,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: subsections.length,
      itemBuilder: (context, index) {
        return SubsectionCard(
          subsection: subsections[index],
        );
      },
    );
  }
}
