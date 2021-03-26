class ZoneModel {
  ZoneModel({
    this.tarifaid,
    this.tipo,
    this.tarifaPrecio,
    this.tarifaLabel,
    this.tarifaExtrasId,
    this.tarifaExtrasPrecio,
    this.tarifaExtrasLabel,
    this.value,
    this.lbl,
    this.label,
  });

  int tarifaid;
  int tipo;
  String tarifaPrecio;
  String tarifaLabel;
  int tarifaExtrasId;
  String tarifaExtrasPrecio;
  String tarifaExtrasLabel;
  int value;
  String lbl;
  String label;

  factory ZoneModel.fromJson(Map<String, dynamic> json) => ZoneModel(
        tarifaid: json["tarifaid"] ?? 0,
        tipo: json["tipo"] ?? 0,
        tarifaPrecio: json["tarifaPrecio"] ?? '',
        tarifaLabel: json["tarifaLabel"] ?? '',
        tarifaExtrasId: json["tarifaExtrasId"] ?? 0,
        tarifaExtrasPrecio: json["tarifaExtrasPrecio"] ?? '',
        tarifaExtrasLabel: json["tarifaExtrasLabel"] ?? '',
        value: json["value"] ?? 0,
        lbl: json["lbl"] ?? '',
        label: json["label"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "tarifaid": tarifaid,
        "tipo": tipo,
        "tarifaPrecio": tarifaPrecio,
        "tarifaLabel": tarifaLabel,
        "tarifaExtrasId": tarifaExtrasId,
        "tarifaExtrasPrecio": tarifaExtrasPrecio,
        "tarifaExtrasLabel": tarifaExtrasLabel,
        "value": value,
        "lbl": lbl,
        "label": label,
      };
}
