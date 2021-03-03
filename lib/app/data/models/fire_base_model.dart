class FirebaseUserModel {
  FirebaseUserModel({
    this.id,
    this.uid,
    this.email,
    this.photo,
    this.name,
    this.alias,
    this.signIn,
  });

  int id;
  String uid;
  String email;
  String photo;
  String name;
  String alias;
  int signIn;

  factory FirebaseUserModel.fromJson(Map<String, dynamic> json) => FirebaseUserModel(
        id: json["id"] ?? 0,
        uid: json["uid"] ?? '',
        email: json["email"] ?? '',
        photo: json["photo"] ?? '',
        name: json["name"] ?? '',
        alias: json["alias"] ?? '',
        signIn: json["signIn"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "email": email,
        "photo": photo,
        "name": name,
        "alias": alias,
        "sign_in_with": signIn,
      };

  @override
  String toString() {
    print("FirebaseUserModel ${toJson()}");
    return super.toString();
  }
}
