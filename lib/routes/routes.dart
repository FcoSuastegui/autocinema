import 'package:autocinema/controllers/bindings/app_bidings.dart';
import 'package:autocinema/views/movie-details/binding/movie_binding.dart';
import 'package:autocinema/views/movie-details/movie_detail_detail.dart';
import 'package:autocinema/views/navbar/binding/nav_bar_binding.dart';
import 'package:autocinema/views/navbar/nav_bar_view.dart';
import 'package:autocinema/views/no-wifi/no_wifi_view.dart';
import 'package:get/get.dart';
part 'pages.dart';

class Routes {
  static final Routes _instancia = Routes._internal();
  factory Routes() => _instancia;
  Routes._internal();

  static final List<GetPage> pages = [
    GetPage(
      name: Pages.NoWifi,
      page: () => NoWifiView(),
    ),
    GetPage(
      name: Pages.MovieDetails,
      page: () => MovieDetails(),
      binding: MovieBinding(),
    ),
    GetPage(
      name: Pages.NavBar,
      page: () => NavBarView(),
      bindings: [
        AppBidings(),
        NavBarBinding(),
      ],
    ),
  ];
}
