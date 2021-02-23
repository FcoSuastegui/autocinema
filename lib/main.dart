import 'package:autocinema/app/app.dart';
import 'package:autocinema/app/utils/get_storage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(App());
}

Future<void> initServices() async {
  print('starting services ...');
  await GetStorages.i.init();
  print('All services started...');
}
