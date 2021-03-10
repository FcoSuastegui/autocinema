class CardHistory {
  CardHistory({
    this.names,
    this.lastName,
    this.email,
    this.address,
    this.phone,
    this.state,
    this.postcode,
    this.card,
  });

  String names;
  String lastName;
  String email;
  String address;
  String phone;
  String state;
  String postcode;
  Card card;

  factory CardHistory.fromJson(Map<String, dynamic> json) => CardHistory(
        names: json["names"] ?? '',
        lastName: json["lastName"] ?? '',
        email: json["email"] ?? '',
        address: json["address"] ?? '',
        phone: json["phone"] ?? '',
        state: json["state"] ?? '',
        postcode: json["postcode"] ?? '',
        card: Card.fromJson(json["card"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "names": names,
        "lastName": lastName,
        "email": email,
        "address": address,
        "phone": phone,
        "state": state,
        "postcode": postcode,
        "card": card.toJson(),
      };
}

class Card {
  Card({
    this.holder,
    this.number,
    this.expired,
    this.cvv,
  });

  String holder;
  String number;
  String expired;
  String cvv;

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        holder: json["holder"] ?? '',
        number: json["number"] ?? '',
        expired: json["expired"] ?? '',
        cvv: json["cvv"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "holder": holder,
        "number": number,
        "expired": expired,
        "cvv": cvv,
      };
}
