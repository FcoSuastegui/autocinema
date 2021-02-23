import 'package:autocinema/app/views/card-add/card_add_view.dart';
import 'package:autocinema/app/views/card-details/card_details_view.dart';
import 'package:autocinema/app/views/card/binding/card_binding.dart';
import 'package:autocinema/app/views/card/card_view.dart';
import 'package:autocinema/app/views/movie-details/binding/movie_binding.dart';
import 'package:autocinema/app/views/movie-details/movie_detail_detail.dart';
import 'package:autocinema/app/views/navbar/binding/nav_bar_binding.dart';
import 'package:autocinema/app/views/navbar/nav_bar_view.dart';
import 'package:autocinema/app/views/no-wifi/no_wifi_view.dart';
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
    /* GetPage(
      name: CardView.routeName,
      page: () => CardView(),
      binding: CardBinding(),
      children: [
        GetPage(
          name: Pages.CardAdd,
          page: () => CardAddView(),
        ),
        GetPage(
          name: Pages.CardDetails,
          page: () => CardDetailsView(),
        ),
      ],
    ), */
    GetPage(
      name: MovieDetails.routeName,
      page: () => MovieDetails(),
      binding: MovieBinding(),
    ),
    GetPage(
      name: NavBarView.routeName,
      page: () => NavBarView(),
    ),
  ];
}
