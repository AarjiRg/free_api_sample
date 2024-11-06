// To parse this JSON data, do
//
//     final productresmodel = productresmodelFromJson(jsonString);

import 'dart:convert';

Productresmodel productresmodelFromJson(String str) => Productresmodel.fromJson(json.decode(str));

String productresmodelToJson(Productresmodel data) => json.encode(data.toJson());

class Productresmodel {
    String? msg;
    List<products>? ListofProducts;

    Productresmodel({
        this.msg,
        this.ListofProducts,
    });

    factory Productresmodel.fromJson(Map<String, dynamic> json) => Productresmodel(
        msg: json["Msg"],
        ListofProducts: json["data"] == null ? [] : List<products>.from(json["data"]!.map((x) => products.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Msg": msg,
        "data": ListofProducts == null ? [] : List<dynamic>.from(ListofProducts!.map((x) => x.toJson())),
    };
}

class products {
    int? id;
    String? name;
    String? description;
    String? price;
    int? stock;
    String? category;
    String? image;

    products({
        this.id,
        this.name,
        this.description,
        this.price,
        this.stock,
        this.category,
        this.image,
    });

    factory products.fromJson(Map<String, dynamic> json) => products(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stock: json["stock"],
        category: json["category"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "stock": stock,
        "category": category,
        "image": image,
    };
}
