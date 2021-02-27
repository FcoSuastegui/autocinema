import 'dart:convert';

MovieModel movieModelFromJson(String str) => MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
  MovieModel({
    this.id,
    this.titulo,
    this.duracion,
    this.categoria,
    this.reciente,
    this.clasificacion,
    this.descripcion,
    this.trailer,
    this.image,
    this.facebook,
    this.horario,
    this.idioma,
    this.director,
    this.actores,
  });

  int id;
  int reciente;
  String titulo;
  String duracion;
  String categoria;
  String clasificacion;
  String descripcion;
  String trailer;
  String image;
  String facebook;
  String horario;
  String idioma;
  String director;
  String actores;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        reciente: json["reciente"],
        titulo: json["titulo"] ?? '',
        duracion: json["duracion"] ?? '',
        categoria: json["categoria"] ?? '',
        clasificacion: json["clasificacion"] ?? '',
        descripcion: json["descripcion"] ?? '',
        trailer: json["trailer"] ?? '',
        image: json["image"] ?? '',
        facebook: json["facebook"] ?? '',
        horario: json["horario"] ?? '',
        idioma: json["idioma"] ?? '',
        director: json["director"] ?? '',
        actores: json["actores"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "duracion": duracion,
        "categoria": categoria,
        "reciente": reciente,
        "clasificacion": clasificacion,
        "descripcion": descripcion,
        "trailer": trailer,
        "image": image,
        "facebook": facebook,
        "horario": horario,
        "idioma": idioma,
        "director": director,
        "actores": actores,
      };
}
