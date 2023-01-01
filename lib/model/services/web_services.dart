import 'dart:convert';
import 'dart:developer';

import 'package:flyket/model/apis/airport.dart';
import 'package:flyket/model/apis/summary.dart';
import 'package:flyket/model/apis/user.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

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

  Future<User?> login(String email, String password) async {
    var url = Uri.parse("${BASE_URL}auth/login");
    Response response = await http.post(
      url,
      body: jsonEncode(
        <String, String>{'email': email, 'password': password},
      ),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      log("response status: " + response.body);
      final body = jsonDecode(response.body);
      return User.fromJson(body["data"]);
    } else {
      return null;
    }
  }

  Future<bool> register(String name, String email, String password) async {
    var url = Uri.parse("${BASE_URL}auth/register");
    Response response = await http.post(
      url,
      body: jsonEncode(
        <String, String>{"name": name, "email": email, "password": password},
      ),
      headers: {'Content-Type': 'application/json'},
    );

    log("response.statusCode: ${response.statusCode}");

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
