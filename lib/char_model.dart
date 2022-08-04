import 'dart:convert';

class CharModel {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  String originPlanet;
  String image;

  CharModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.originPlanet,
    required this.image,
  });

  factory CharModel.fromMap(Map<String, dynamic> map) {
    return CharModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      status: map['status'] ?? '',
      species: map['species'] ?? '',
      type: map['type'] ?? '',
      gender: map['gender'] ?? '',
      originPlanet: map['origin']['name'] ?? '',
      image: map['image'] ?? '',
    );
  }
}
