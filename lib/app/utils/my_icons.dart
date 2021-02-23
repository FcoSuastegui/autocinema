import 'package:flutter/material.dart';

class IconString {
  static final IconString _instancia = new IconString._internal();
  factory IconString() => _instancia;
  IconString._internal();

  static Icon name(
    String name, {
    double size = 25.0,
    dynamic color = Colors.black87,
  }) {
    Map<String, dynamic> icon = {
      'home': Icon(Icons.home, color: color, size: size),
      'person_outline': Icon(Icons.person_outline, color: color, size: size),
      'announcement': Icon(Icons.announcement, color: color, size: size),
      'attach_money': Icon(Icons.attach_money, color: color, size: size),
      'assignment': Icon(Icons.assignment, color: color, size: size),
      'thumbs_up_down': Icon(Icons.thumbs_up_down, color: color, size: size),
      'library_books': Icon(Icons.library_books, color: color, size: size),
      'exit_to_app': Icon(Icons.exit_to_app, color: color, size: size),
      'cake': Icon(Icons.cake, color: color, size: size),
      'monetization_on': Icon(Icons.monetization_on, color: color, size: size),
      'restaurant': Icon(Icons.restaurant, color: color, size: size),
      'spa': Icon(Icons.spa, color: color, size: size),
      'hotel': Icon(Icons.hotel, color: color, size: size),
      'directions_car': Icon(Icons.directions_car, color: color, size: size),
      'local_bar': Icon(Icons.local_bar, color: color, size: size),
      'pool': Icon(Icons.pool, color: color, size: size),
      'new_releases': Icon(Icons.new_releases, color: color, size: size),
      'room_service': Icon(Icons.room_service, color: color, size: size),
      'golf_course': Icon(Icons.golf_course, color: color, size: size),
      'beach_access': Icon(Icons.beach_access, color: color, size: size),
      'event': Icon(Icons.event, color: color, size: size),
      'settings': Icon(Icons.settings, color: color, size: size),
      'card_giftcard': Icon(Icons.card_giftcard, color: color, size: size),
      'notifications': Icon(Icons.notifications, color: color, size: size),
      'done': Icon(Icons.done, color: color, size: size),
      'done_all': Icon(Icons.done_all, color: color, size: size),
      'account_circle': Icon(Icons.account_circle, color: color, size: size),
      'movie': Icon(Icons.movie, color: color, size: size),
      'calendar_today': Icon(Icons.calendar_today, color: color, size: size),
    };

    return icon[name] ?? Icon(Icons.home, color: color, size: size);
  }
}
