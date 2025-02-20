import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:madagascar_workcoode/app/app.dart';
import 'package:madagascar_workcoode/core/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    MobileAds.instance.initialize();
  }
  await setupLocator();
  runApp(const App());
}
