import 'dart:convert';
import 'package:http/http.dart' as http;

class UserProfileObj {
  int id;
  String name;
  String email;
  // String password;
  String telp;
  String avatarUrl;

  UserProfileObj(
      {required this.id,
      required this.name,
      required this.email,
      // required this.password,
      required this.telp,
      required this.avatarUrl});

  factory UserProfileObj.createUserProfile(Map<String, dynamic> json) {
    return UserProfileObj(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        // password: json['password'],
        telp: json['biodata'][0]['telp'],
        avatarUrl: json['avatar'][0]['imagekit_url']);
  }

  static Future<UserProfileObj> getUser(int id) async {
    // String apiURL = "https://flytick-dev.up.railway.app/api/user/${id}";

    String apiURL = "https://flytick-prod.up.railway.app/api/${id}";

    var response = await http.get(Uri.parse(apiURL), headers: {
      'Authorization':
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmFtZSI6IlNla2FyIE1LIiwiZW1haWwiOiJzZWthcm1hZHVrdXN1bWF3YXJkYW5pQGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiJDJiJDEwJE1RanJ2bWNLVy54cXpHQWhobElsTE9aa0pjTHJIdC5hbWVUNk1aOE9tTVhqeXREUmVGVGp1IiwiYXZhdGFyX2lkIjoxLCJyb2xlIjoiYWRtaW4iLCJiYWxhbmNlIjo1MDAwMDAwMCwiYmlvZGF0YV9pZCI6MSwibG9naW5fdHlwZSI6ImJhc2ljIiwiaWF0IjoxNjcyNDYxMDk3fQ.SHN2kiwKunKODF-49SOJYwwH9ejvfkLibWeML09YMUY"
    });
    if (response.statusCode == 200) {
      var jsonObject = json.decode(response.body);
      var user = (jsonObject as Map<String, dynamic>)['data'];

      return UserProfileObj.createUserProfile(user);
    } else {
      throw response.statusCode;
    }
  }
}
