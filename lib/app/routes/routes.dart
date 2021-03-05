import 'package:autocinema/app/utils/helper.dart';
import 'package:autocinema/app/views/boleto/binding/boleto_binding.dart';
import 'package:autocinema/app/views/boleto/boleto_view.dart';
import 'package:autocinema/app/views/login/login_view.dart';
import 'package:autocinema/app/views/movie-details/binding/movie_detail_binding.dart';
import 'package:autocinema/app/views/movie-details/movie_detail_detail.dart';
import 'package:autocinema/app/views/navbar/nav_bar_view.dart';
import 'package:autocinema/app/views/no-wifi/no_wifi_view.dart';
import 'package:autocinema/app/views/on-boarding/bindings/on_boarding_binding.dart';
import 'package:autocinema/app/views/on-boarding/on_boarding_view.dart';
import 'package:get/get.dart';

class Routes {
  static final Routes _instancia = Routes._internal();
  factory Routes() => _instancia;
  Routes._internal();

  static final List<GetPage> pages = [
    GetPage(
      name: NoWifiView.routeName,
      page: () => NoWifiView(),
    ),
    GetPage(
      name: LoginView.routeName,
      page: () => LoginView(),
    ),
    GetPage(
      name: OnBoardingView.routeName,
      page: () => OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: BoletoView.routeName,
      page: () => BoletoView(),
      binding: BoletoBinding(),
    ),
    GetPage(
      name: MovieDetails.routeName,
      page: () => MovieDetails(),
      binding: MovieDetailBinding(),
    ),
    GetPage(
      name: NavBarView.routeName,
      page: () => NavBarView(),
    ),
  ];

  static goToPage(String page, {dynamic arguments}) {
    print(page);
    pages.any((e) => e.name == page)
        ? Get.toNamed(
            page,
            arguments: arguments,
            preventDuplicates: false,
          )
        : Helper.error(
            message: "El módulo no esta disponible o no tienes acceso a ello.",
          );
  }
}
