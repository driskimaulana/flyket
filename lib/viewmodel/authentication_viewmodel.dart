import 'package:flutter/cupertino.dart';
import 'package:flyket/model/apis/user.dart';
import 'package:flyket/model/services/web_services.dart';

class AuthenticationViewModel extends ChangeNotifier {
  Future<User?> login(String email, String password) {
    return WebServices().login(email, password);
  }

  Future<bool> register(String name, String email, String password) {
    return WebServices().register(name, email, password);
  }
}
