// To parse this JSON data, do
//
//     final rickAndMortyModels = rickAndMortyModelsFromJson(jsonString);

import 'dart:convert';

RickAndMortyModels rickAndMortyModelsFromJson(String str) => RickAndMortyModels.fromJson(json.decode(str));

String rickAndMortyModelsToJson(RickAndMortyModels data) => json.encode(data.toJson());

class RickAndMortyModels {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Location? origin;
  Location? location;
  String? image;
  List<String>? episode;
  String? url;
  DateTime? created;

  RickAndMortyModels({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  factory RickAndMortyModels.fromJson(Map<String, dynamic> json) => RickAndMortyModels(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    status: json["status"] == null ? null : json["status"],
    species: json["species"] == null ? null : json["species"],
    type: json["type"] == null ? null : json["type"],
    gender:  json["gender"] == null ? null : json["gender"],
    origin: json["origin"] == null ? null : Location.fromJson(json["origin"]),
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    image:  json["image"] == null ? null : json["image"],
    episode: json["episode"] == null ? [] : List<String>.from(json["episode"]!.map((x) => x)),
    url: json["url"] == null ? null : json["url"],
    created: json["created"] == null ? null : DateTime.parse(json["created"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "status": status == null ? null : status,
    "species": species == null ? null : species,
    "type": type == null ? null : type,
    "gender": gender == null ? null : gender,
    "origin": origin?.toJson(),
    "location": location?.toJson(),
    "image": image == null ? null : image,
    "episode": episode == null ? [] : List<dynamic>.from(episode!.map((x) => x)),
    "url": url == null ? null : url,
    "created": created?.toIso8601String(),
  };
}

class Location {
  String? name;
  String? url;

  Location({
    this.name,
    this.url,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"] == null ? null : json["name"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "url":  url == null ? null : url,
  };
}
