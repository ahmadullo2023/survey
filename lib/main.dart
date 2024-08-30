import 'package:chuck_interceptor/chuck.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'core/singletons/app_path_provider.dart';
import 'core/singletons/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppPathProvider.initPath();

  await setupLocator();

  runApp(const MyApp());

}
