import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flyket/model/apis/user.dart';
import 'package:flyket/model/services/web_services.dart';

class UserViewModel extends ChangeNotifier {
  late User user;

  Future<User> whoAmI(String token) async {
    final result = await WebServices().whoAmI(token);
    user = result;
    notifyListeners();
    return user;
  }

  void setLoggedinUser(User loggedInUser) {
    user = loggedInUser;
    notifyListeners();
  }
}
