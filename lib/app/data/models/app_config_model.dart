class AppConfigModel {
  AppConfigModel({
    this.aviso,
    this.terminos,
  });

  String aviso;
  String terminos;

  factory AppConfigModel.fromJson(Map<String, dynamic> json) => AppConfigModel(
        aviso: json["aviso"] ?? '',
        terminos: json["terminos"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "aviso": aviso,
        "terminos": terminos,
      };
}
