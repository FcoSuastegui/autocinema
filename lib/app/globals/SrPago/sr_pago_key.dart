class SrPagoKey {
  SrPagoKey({
    this.id,
    this.publicKeyAndroid,
    this.publicKeyIos,
    this.liveMode,
  });

  int id;
  String publicKeyAndroid;
  String publicKeyIos;
  bool liveMode;

  factory SrPagoKey.fromJson(Map<String, dynamic> json) => SrPagoKey(
        id: json["id"] ?? 0,
        publicKeyAndroid: json["publicKeyAndroid"] ?? '',
        publicKeyIos: json["publicKeyIos"] ?? '',
        liveMode: json["liveMode"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "publicKeyAndroid": publicKeyAndroid,
        "publicKeyIos": publicKeyIos,
        "liveMode": liveMode,
      };
}
