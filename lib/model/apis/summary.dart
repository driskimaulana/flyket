import 'dart:convert';
import 'package:http/http.dart' as http;

class Summary {
  String name;
  int buyer, income;
  Summary({required this.name, required this.buyer, required this.income});

  factory Summary.createSummery(Map<String, dynamic> json) {
    return Summary(
      name: json['name'],
      buyer: json['buyer'],
      income: json['income'],
    );
  }
  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      name: json['name'],
      buyer: json['buyer'],
      income: json['income'],
    );
  }

  static Future<List<Summary>> fetchSummary() async {
    var url =
        Uri.parse('https://flytick-dev.up.railway.app/api/summary/country');
    var response = await http.get(url, headers: {
      'Authorization':
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmFtZSI6IlNla2FyIE1LIiwiZW1haWwiOiJzZWthcm1hZHVrdXN1bWF3YXJkYW5pQGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiJDJiJDEwJEhNemhkbDNYNTZLZVY4d1Zaa2JNd3VFU1hqMXlCYWhqSk8zVFRCSW5idjBDYTY2QXVNTmJPIiwiYXZhdGFyX2lkIjoxLCJyb2xlIjoic3VwZXJhZG1pbiIsImJhbGFuY2UiOjEwMDAwMDAwLCJiaW9kYXRhX2lkIjoxLCJsb2dpbl90eXBlIjoiYmFzaWMiLCJpYXQiOjE2NzA4MzAwMTF9.vzjAE1wpAIs8EHiALns_T3yyX9wX2eKczu7ab-bsa5k"
    });
    if (response.statusCode == 200) {
      var jsonObject = json.decode(response.body);
      List<dynamic> listSummary = (jsonObject as Map<String, dynamic>)['data'];

      List<Summary> summeries = [];
      for (int i = 0; i < listSummary.length; i++) {
        summeries.add(Summary.createSummery(listSummary[i]));
      }
      return summeries;
    } else {
      throw Exception("Unable to perform request");
    }
  }
}
