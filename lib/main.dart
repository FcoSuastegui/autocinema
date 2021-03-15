import 'package:autocinema/app/app.dart';
import 'package:autocinema/app/globals/controller/app_config_controller.dart';
import 'package:autocinema/app/utils/storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(App());
}

Future<void> initServices() async {
  print('starting services ...');
  await Storage.init();
  await Firebase.initializeApp();
  AppConfigController().getConfigBackend();
  print('All services started...');
}
