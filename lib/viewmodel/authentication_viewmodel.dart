import 'package:flutter/cupertino.dart';
import 'package:flyket/model/apis/user.dart';
import 'package:flyket/model/services/web_services.dart';

class AuthenticationViewModel extends ChangeNotifier {
  late User user;

  Future<User?> login(String email, String password) async {
    final result = await WebServices().login(email, password);
    user = result!;
    notifyListeners();
    return result;
  }

  Future<bool> register(String name, String email, String password) {
    return WebServices().register(name, email, password);
  }
}
