// To parse this JSON data, do
//
//     final quranModel = quranModelFromJson(jsonString);

import 'dart:convert';

import 'package:first_app/models/ayah.dart';

class QuranModel {
  int number;
  String name;
  String englishName;
  String englishNameTranslation;
  String revelationType;
  List<AyahModel> ayahs;

  QuranModel({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.ayahs,
  });

  factory QuranModel.fromRawJson(String str) =>
      QuranModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuranModel.fromJson(Map<String, dynamic> json) => QuranModel(
        number: json["number"],
        name: json["name"],
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        revelationType: json["revelationType"],
        ayahs: List<AyahModel>.from(
            json["ayahs"].map((x) => AyahModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "revelationType": revelationType,
        "ayahs": List<dynamic>.from(ayahs.map((x) => x.toJson())),
      };
}
