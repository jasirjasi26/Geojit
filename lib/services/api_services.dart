import 'package:geojit_test_app/model/all_data.dart';
import 'package:http/http.dart' as http;


class ApiService {
  static  var client =http.Client();


  static Future<AllData?> getAll() async {
   final response = await client.get(Uri.parse(
        'https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      print(response.body);
      return allDataFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<AllData?> getSearchData(String value) async {
    final response = await client.get(Uri.parse(
        'https://dummyjson.com/products/search?${value}'));
    if (response.statusCode == 200) {
      print(response.body);
      return allDataFromJson(response.body);
    } else {
      return null;
    }
  }
}