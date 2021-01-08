import 'package:autocinema/app.dart';
import 'package:autocinema/controllers/connectivity_controller.dart';
import 'package:autocinema/helpers/get_storages.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(App());
}

Future<void> initServices() async {
  print('starting services ...');
  await GetStorages.i.init();
  await ConnectivityController.i.onInit();
  print('All services started...');
}
