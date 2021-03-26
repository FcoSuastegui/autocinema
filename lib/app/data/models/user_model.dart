class UserModel {
  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.photo,
    this.signIn,
    this.rol,
  });

  int id;
  String name;
  String username;
  String email;
  String photo;
  String rol;
  int signIn;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        username: json["alias"] ?? '',
        email: json["email"] ?? '',
        photo: json["photo"] ?? '',
        rol: json["rol"] ?? 'Visitante',
        signIn: json["sign_in_with"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "photo": photo,
        "rol": rol,
        "sign_in_with": signIn,
      };
}
