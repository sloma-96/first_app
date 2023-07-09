import 'dart:convert';
import 'package:first_app/models/surah.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../helpers/consts_heloer.dart';
import '../models/ayah.dart';
import '../services/api.dart';

class SurahProvider with ChangeNotifier {
  //utils
  Api api = Api();
  //data
  List<QuranModel> quran = [];
  List<AyahModel> ayah = [];
  AyahModel? ayahModel;

  bool isLoading = false;

  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  fetchSurah() async {
    setLoading(true);
    var response = await api.get(Url);
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('OOOK');
      }
      var decodedData = json.decode(response.body)["data"]["surahs"];

      for (var item in decodedData) {
        quran.add(QuranModel.fromJson(item));
      }
    } else {
      if (kDebugMode) {
        print("NOOO");
      }
    }
    setLoading(false);
  }

  fetchSingleSurah() async {
    setLoading(true);
    final response = await api.get(Url);
    if (response.statusCode == 200) {
//var ayahModel = AyahModel.fromJson( json.decode(response.body))["data"]["surahs"];
      ayahModel = AyahModel.fromJson(json.decode(response.body));
    } else {
      if (kDebugMode) {
        print('FAILED REQUEST');
      }
    }
    setLoading(false);
  }

  fetchAyah() async {
    setLoading(true);
    var response = await api.get(Url);
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('OOOK');
      }
      var decodedData = json.decode(response.body)["data"]["surahs"];

      for (var item in decodedData) {
        quran.add(QuranModel.fromJson(item));
      }
    } else {
      if (kDebugMode) {
        print("NOOO");
      }
    }
    setLoading(false);
  }
}
