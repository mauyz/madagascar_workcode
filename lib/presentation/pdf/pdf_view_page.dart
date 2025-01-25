import 'package:flutter/material.dart';
import 'package:madagascar_workcoode/app/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewPage extends StatelessWidget {
  const PdfViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sharedPreferences = locator.get<SharedPreferences>();
    return SfPdfViewer.asset(
      "assets/code.pdf",
      initialPageNumber: sharedPreferences.getInt("lastPage") ?? 1,
      onPageChanged: (details) {
          sharedPreferences.setInt("lastPage", details.newPageNumber);
      },
    );
  }
}
