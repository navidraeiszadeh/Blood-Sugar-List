import 'package:dio/dio.dart';
import 'package:untitled/data/blood_sugar.model.dart';

String token =
    "665d6ee12ce39d79cd7d0f203b30f44eb4dd17d07a7638f29fd2241cda3e536e";
String previous =
    "https://devapi.staging.mamania.me/patients/me/health-data/blood-sugar/v1/?limit=10";
String URL =
    "https://devapi.staging.mamania.me/patients/me/health-data/blood-sugar/v1/?limit=10";
int count = 10;

Future<List<Blood>> getAllData() async {
  Response response = await Dio().get(URL,
      options: Options(
        headers: {"Authorization": "Token $token"},
      ));
  Map<String, dynamic> bloodDataFromJson = response.data as Map<String, dynamic>;
  count = bloodDataFromJson["count"];
  if (bloodDataFromJson["next"] != null) {
    URL = "https://devapi.staging.mamania.me" + bloodDataFromJson["next"];
  } else {
    URL =
    "https://devapi.staging.mamania.me/patients/me/health-data/blood-sugar/v1/?limit=10";
  }
  if (bloodDataFromJson["previous"] != null) {
    previous =
        "https://devapi.staging.mamania.me" + bloodDataFromJson["previous"];
  }
  List results = bloodDataFromJson["results"];
  List<Map<String, dynamic>> bloodSugarList = [];
  for (var element in results) {
    bloodSugarList.add(element);
  }
  List<Blood> map = bloodSugarList.map((e) => Blood.fromJson(e)).toList();
  return map;
}