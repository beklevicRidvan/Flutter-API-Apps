// To parse this JSON data, do
//
//     final characters = charactersFromMap(jsonString);

import 'dart:convert';

MyCharacters charactersFromMap(String str) => MyCharacters.fromMap(json.decode(str));

String charactersToMap(MyCharacters data) => json.encode(data.toMap());

class MyCharacters {
  final String karakterAdi;
  final String sehir;
  final String tur;
  final List<Yetenekler> yetenekler;

  MyCharacters({
    required this.karakterAdi,
    required this.sehir,
    required this.tur,
    required this.yetenekler,
  });

  factory MyCharacters.fromMap(Map<String, dynamic> json) => MyCharacters(
    karakterAdi: json["karakter_adi"],
    sehir: json["sehir"],
    tur: json["tur"],
    yetenekler: List<Yetenekler>.from(json["yetenekler"].map((x) => Yetenekler.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "karakter_adi": karakterAdi,
    "sehir": sehir,
    "tur": tur,
    "yetenekler": List<dynamic>.from(yetenekler.map((x) => x.toMap())),
  };
}

class Yetenekler {
  final String yetenekAdi;
  final String ozellik;
  final bool savunma;

  Yetenekler({
    required this.yetenekAdi,
    required this.ozellik,
    required this.savunma,
  });

  factory Yetenekler.fromMap(Map<String, dynamic> json) => Yetenekler(
    yetenekAdi: json["yetenek_adi"],
    ozellik: json["ozellik"],
    savunma: json["savunma"],
  );

  Map<String, dynamic> toMap() => {
    "yetenek_adi": yetenekAdi,
    "ozellik": ozellik,
    "savunma": savunma,
  };
}
