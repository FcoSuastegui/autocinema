class StateModel {
  StateModel({
    this.label,
    this.value,
    this.abreviatura,
  });

  String label;
  int value;
  String abreviatura;

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        label: json["label"],
        value: json["value"],
        abreviatura: json["abreviatura"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
        "abreviatura": abreviatura,
      };
}
