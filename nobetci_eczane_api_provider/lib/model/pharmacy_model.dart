import 'dart:convert';

PharmacyModel pharmacyModelFromJson(String str) => PharmacyModel.fromJson(json.decode(str));

String pharmacyModelToJson(PharmacyModel data) => json.encode(data.toJson());

class PharmacyModel {
  String name;
  String dist;
  String address;
  String phone;
  String loc;

  PharmacyModel({
    required this.name,
    required this.dist,
    required this.address,
    required this.phone,
    required this.loc,
  });

  factory PharmacyModel.fromJson(Map<String, dynamic> json) => PharmacyModel(
    name: json["name"],
    dist: json["dist"],
    address: json["address"],
    phone: json["phone"],
    loc: json["loc"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "dist": dist,
    "address": address,
    "phone": phone,
    "loc": loc,
  };
}
