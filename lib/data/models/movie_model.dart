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
    this.img,
    this.facebook,
    this.horario,
    this.idioma,
  });

  int id;
  int reciente;
  String titulo;
  String duracion;
  String categoria;
  String clasificacion;
  String descripcion;
  String trailer;
  String img;
  String facebook;
  String horario;
  String idioma;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        reciente: json["reciente"],
        titulo: json["titulo"] ?? '',
        duracion: json["duracion"] ?? '',
        categoria: json["categoria"] ?? '',
        clasificacion: json["clasificacion"] ?? '',
        descripcion: json["descripcion"] ?? '',
        trailer: json["trailer"] ?? '',
        img: json["img"] ?? '',
        facebook: json["facebook"] ?? '',
        horario: json["horario"] ?? '',
        idioma: json["idioma"] ?? '',
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
        "img": img,
        "facebook": facebook,
        "horario": horario,
        "idioma": idioma,
      };
}
