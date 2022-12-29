import 'dart:convert';

import 'package:flyket/model/apis/airport.dart';
import 'package:http/http.dart' as http;

class WebServices {
  static const String BASE_URL = "https://flytick-dev.up.railway.app/api/";

  Future<List<Airport>> fetchAirportList() async {
    String endpoint = "airport";
    var url = Uri.parse(BASE_URL + endpoint);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["data"];
      return json.map((e) => Airport.fromJson(e)).toList();
    } else {
      throw Exception("Unable to perform request");
    }
  }
}
