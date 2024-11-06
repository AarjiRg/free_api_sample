// To parse this JSON data, do
//
//     final loginmodel = loginmodelFromJson(jsonString);

import 'dart:convert';

Loginmodel loginmodelFromJson(String str) => Loginmodel.fromJson(json.decode(str));

String loginmodelToJson(Loginmodel data) => json.encode(data.toJson());

class Loginmodel {
    String? refresh;
    String? access;
    int? id;
    String? name;
    String? place;
    String? email;

    Loginmodel({
        this.refresh,
        this.access,
        this.id,
        this.name,
        this.place,
        this.email,
    });

    factory Loginmodel.fromJson(Map<String, dynamic> json) => Loginmodel(
        refresh: json["refresh"],
        access: json["access"],
        id: json["id"],
        name: json["name"],
        place: json["place"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
        "id": id,
        "name": name,
        "place": place,
        "email": email,
    };
}
