import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:localization_arb_example/example/model.dart';

class Services {


  static Future<List<Spacecraft>> getUsers() async {
    try {
      final response = await http.get(Uri.parse("http://178.18.247.188:8012/api/clt-serv-full/"));
      if (response.statusCode == 200) {
        List<Spacecraft> list = parseUsers(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Spacecraft> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Spacecraft>((json) => Spacecraft.fromJson(json)).toList();
  }
}