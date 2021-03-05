class HoraryModel {
  HoraryModel({
    this.id,
    this.fecha,
    this.fechaCorta,
    this.fechaLarga,
    this.funcionIdioma,
    this.dia,
    this.hora,
    this.subtitulo,
    this.idioma,
    this.isSubtitulada,
    this.tarifa,
    this.tarifaExtras,
    this.idTarifa,
    this.idTarifaPersonasExtra,
  });

  int id;
  String fecha;
  String fechaCorta;
  String fechaLarga;
  String funcionIdioma;
  String dia;
  String hora;
  String subtitulo;
  String idioma;
  bool isSubtitulada;
  String tarifa;
  String tarifaExtras;
  int idTarifa;
  int idTarifaPersonasExtra;

  factory HoraryModel.fromJson(Map<String, dynamic> json) => HoraryModel(
        id: json["id"] ?? 0,
        fecha: json["fecha"] ?? '',
        fechaCorta: json["fechaCorta"] ?? '',
        fechaLarga: json["fechaLarga"] ?? '',
        funcionIdioma: json["funcionIdioma"] ?? '',
        dia: json["dia"] ?? '',
        hora: json["hora"] ?? '',
        subtitulo: json["subtitulo"] ?? '',
        idioma: json["idioma"] ?? '',
        isSubtitulada: json["isSubtitulada"] ?? false,
        tarifa: json["tarifa"] ?? '0.0',
        tarifaExtras: json["tarifaExtras"] ?? '0.0',
        idTarifa: json["idTarifa"] ?? 0,
        idTarifaPersonasExtra: json["idTarifaPersonasExtra"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fecha": fecha,
        "fechaCorta": fechaCorta,
        "fechaLarga": fechaLarga,
        "funcionIdioma": funcionIdioma,
        "dia": dia,
        "hora": hora,
        "subtitulo": subtitulo,
        "idioma": idioma,
        "isSubtitulada": isSubtitulada,
        "tarifa": tarifa,
        "tarifaExtras": tarifaExtras,
        "idTarifa": idTarifa,
        "idTarifaPersonasExtra": idTarifaPersonasExtra,
      };
}
