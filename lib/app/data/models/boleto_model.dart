class BoletoModel {
  BoletoModel({
    this.titulo,
    this.imagen,
    this.folio,
    this.folioBoleto,
    this.diaLargo,
    this.dia,
    this.hora,
    this.titular,
    this.estatus,
    this.fechaUso,
    this.vehiculos,
    this.extras,
    this.total,
  });

  String titulo;
  String imagen;
  String folio;
  String folioBoleto;
  String diaLargo;
  String dia;
  String hora;
  String titular;
  bool estatus;
  String fechaUso;
  int vehiculos;
  int extras;
  String total;

  factory BoletoModel.fromJson(Map<String, dynamic> json) => BoletoModel(
        titulo: json["titulo"] ?? '',
        imagen: json["imagen"] ?? '',
        folio: json["folio"] ?? '',
        folioBoleto: json["folioBoleto"] ?? '',
        diaLargo: json["diaLargo"] ?? '',
        dia: json["dia"] ?? '',
        hora: json["hora"] ?? '',
        titular: json["titular"] ?? '',
        estatus: json["estatus"] ?? false,
        fechaUso: json["fechaUso"] ?? '',
        vehiculos: json["vehiculos"] ?? 0,
        extras: json["extras"] ?? 0,
        total: json["total"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "imagen": imagen,
        "folio": folio,
        "folioBoleto": folioBoleto,
        "diaLargo": diaLargo,
        "dia": dia,
        "hora": hora,
        "titular": titular,
        "estatus": estatus,
        "fechaUso": fechaUso,
        "vehiculos": vehiculos,
        "extras": extras,
        "total": total,
      };
}
