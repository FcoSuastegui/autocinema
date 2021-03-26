class ConfigurationModel {
  ConfigurationModel({
    this.referencia,
    this.valor,
  });

  String referencia;
  String valor;

  factory ConfigurationModel.fromJson(Map<String, dynamic> json) => ConfigurationModel(
        referencia: json["referencia"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "referencia": referencia,
        "valor": valor,
      };
}
