part of 'routes.dart';

class Pages {
  static final Pages _instancia = Pages._internal();
  factory Pages() => _instancia;
  Pages._internal();

  static const Home = "/home";
  static const Carrito = "/carrito";
  static const Detalle = "/carrito-detalle";
  static const NavBar = "/nav-bar";
  static const NoWifi = "/no-wifi";
  static const MovieDetails = "/movie-details";
  static const Card = "/card";
  static const CardAdd = "/card-add";
  static const CardDetails = "/card-details";
}
