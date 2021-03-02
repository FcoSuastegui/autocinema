import 'package:autocinema/app/globals/bindings/global_binding.dart';
import 'package:autocinema/app/shared/logger/logger_utils.dart';
import 'package:autocinema/app/themes/theme_style.dart';
import 'package:autocinema/app/utils/i18.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:autocinema/app/routes/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeStyle.init(context);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
      statusBarBrightness: Brightness.dark, //status bar brigtness
      statusBarIconBrightness: Brightness.light, //status barIcon Brightness
      systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icon
    ));

    return GetMaterialApp(
      title: 'AutoCinema',
      getPages: Routes.pages,
      initialRoute: '/nav-bar',
      debugShowCheckedModeBanner: false,
      theme: ThemeStyle.lightTheme,
      darkTheme: ThemeStyle.darkTheme,
      locale: Get.deviceLocale,
      translations: I18(),
      initialBinding: GlobalBinding(),
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
    );
  }
}
