import 'dart:convert';
import 'package:http/http.dart' as http;

class UserNotificationObj {
  String topic;
  String title;
  String message;
  bool isRead;
  String createdAt;

  UserNotificationObj(
      {required this.topic,
      required this.title,
      required this.message,
      required this.isRead,
      required this.createdAt});

  factory UserNotificationObj.createUserNotification(
      Map<String, dynamic> json) {
    return UserNotificationObj(
        topic: json['topic'],
        title: json['title'],
        message: json['message'],
        isRead: json['is_read'],
        createdAt: json['createdAt']);
  }

  static Future<List<UserNotificationObj>> getUserNotifications(
      String token) async {
    String apiURL = "https://flytick-dev.up.railway.app/api/notification";

    var response =
        await http.get(Uri.parse(apiURL), headers: {'Authorization': token});
    if (response.statusCode == 200) {
      var jsonObject = json.decode(response.body);
      List<dynamic> listUserNotificationObj =
          (jsonObject as Map<String, dynamic>)['data'];

      List<UserNotificationObj> userNotifications = [];
      for (int i = 0; i < listUserNotificationObj.length; i++) {
        userNotifications.add(UserNotificationObj.createUserNotification(
            listUserNotificationObj[i]));
      }

      return userNotifications;
    } else {
      throw response.statusCode;
    }
  }

  static Future<bool> readAllNotifications() async {
    String apiURL =
        "https://flytick-dev.up.railway.app/api/notification/read-all";

    var response = await http.put(Uri.parse(apiURL), headers: {
      'Authorization':
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmFtZSI6IlNla2FyIE1LIiwiZW1haWwiOiJzZWthcm1hZHVrdXN1bWF3YXJkYW5pQGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiJDJiJDEwJEhNemhkbDNYNTZLZVY4d1Zaa2JNd3VFU1hqMXlCYWhqSk8zVFRCSW5idjBDYTY2QXVNTmJPIiwiYXZhdGFyX2lkIjoxLCJyb2xlIjoic3VwZXJhZG1pbiIsImJhbGFuY2UiOjEwMDAwMDAwLCJiaW9kYXRhX2lkIjoxLCJsb2dpbl90eXBlIjoiYmFzaWMiLCJpYXQiOjE2NzA4MzAwMTF9.vzjAE1wpAIs8EHiALns_T3yyX9wX2eKczu7ab-bsa5k"
    });
    if (response.statusCode == 200) {
      var jsonObject = json.decode(response.body);
      var isRead = (jsonObject as Map<String, dynamic>)['data'][0];

      return (isRead == 0 ? false : true);
    } else {
      throw response.statusCode;
    }
  }
}
