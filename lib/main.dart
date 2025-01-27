import 'package:flutter/material.dart';
import 'package:madagascar_workcoode/app/app.dart';
import 'package:madagascar_workcoode/core/service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const App());
}
