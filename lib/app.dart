import 'package:autocinema/controllers/bindings/app_bidings.dart';
import 'package:autocinema/helpers/get_storages.dart';
import 'package:autocinema/helpers/i18.dart';
import 'package:autocinema/shared/logger/logger_utils.dart';
import 'package:flutter/material.dart';

import 'package:autocinema/themes/theme_style.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:autocinema/routes/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GetMaterialApp(
        title: 'AutoCinema',
        getPages: Routes.pages,
        initialRoute: GetStorages.i.page,
        debugShowCheckedModeBanner: false,
        theme: ThemeStyle.lightTheme,
        darkTheme: ThemeStyle.darkTheme,
        locale: Get.deviceLocale,
        translations: I18(),
        initialBinding: AppBidings(),
        defaultTransition: Transition.fadeIn,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (deviceLocale, supporteLocate) => supporteLocate.first,
        supportedLocales: [
          const Locale('es'), // Español
          const Locale('en'), // English
        ],
        enableLog: true,
        logWriterCallback: Logger.write,
      ),
    );
  }
}
