class MovieModel {
  MovieModel({
    this.id,
    this.titulo,
    this.folio,
    this.mapa,
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
    this.evento,
    this.actores,
  });

  int id;
  int reciente;
  String titulo;
  String folio;
  String mapa;
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
  int evento;
  String actores;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"] ?? 0,
        reciente: json["reciente"] ?? 0,
        titulo: json["titulo"] ?? '',
        folio: json["folio"] ?? '',
        mapa: json["mapa"] ?? '',
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
        evento: json["evento"] ?? 0,
        actores: json["actores"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "folio": folio,
        "mapa": mapa,
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
        "evento": evento,
        "actores": actores,
      };
}
