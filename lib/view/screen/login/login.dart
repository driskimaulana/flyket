import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flyket/model/apis/user.dart';
import 'package:flyket/viewmodel/authentication_viewmodel.dart';
import 'package:flyket/viewmodel/login_viewmodel.dart';
import 'package:flyket/viewmodel/user_viewmodel.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static const nameRoute = '/homepage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final mainColor = const Color(0xff02929A);

  final emailCtr = TextEditingController();
  final passwordCtr = TextEditingController();

  bool isLoading = false;

  bool isInputValid = true;
  String? errorEmailText = null;
  String? errorPasswordText = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 100,
                        padding: EdgeInsets.only(top: 30),
                        child: Image(
                            image: AssetImage('assets/images/logofull.png')),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: 150,
                        child:
                            Image(image: AssetImage('assets/images/text.png')),
                      ),
                      Container(
                        width: 230,
                        child: Image(
                            image: AssetImage('assets/images/loginImg.png')),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: ((context, index) => Container(
                            margin: const EdgeInsets.all(20),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                style: BorderStyle.solid,
                                width: 1.0,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  "Login",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(top: 10),
                                    child: const Text(
                                      "Login to start your exploration.",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: TextField(
                                    autofocus: true,
                                    controller: emailCtr,
                                    cursorColor: Colors.amber,
                                    showCursor: true,
                                    autocorrect: false,
                                    textAlignVertical: TextAlignVertical.bottom,
                                    // textCapitalization:
                                    //     TextCapitalization.characters,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff02929A))),
                                      prefixIcon: Icon(
                                        Icons.email,
                                        size: 25,
                                      ),
                                      errorText:
                                          !isInputValid ? errorEmailText : null,
                                      hintText: "Your Email Address",
                                      labelText: "Email",
                                      // labelStyle: TextStyle(color: Color(0xff02929A)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: TextField(
                                    // autofocus: true,
                                    cursorColor: Colors.amber,
                                    controller: passwordCtr,
                                    showCursor: true,
                                    autocorrect: false,
                                    obscureText: true,
                                    textAlignVertical: TextAlignVertical.bottom,
                                    // textCapitalization:
                                    //     TextCapitalization.characters,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      errorText: !isInputValid
                                          ? errorPasswordText
                                          : null,
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff02929A))),
                                      prefixIcon: Icon(
                                        Icons.remove_red_eye,
                                        size: 25,
                                      ),
                                      hintText: "Password",
                                      labelText: "Password",
                                      // labelStyle: TextStyle(color: Color(0xff02929A)),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: mainColor,
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(top: 15),
                                  width: MediaQuery.of(context).size.width,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: _handleLogin,
                                    child: const Text('Login'),
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(top: 10),
                                    child: const Text(
                                      "Don't have any account in Flyket?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                    )),
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(top: 10),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Color(0xff02929A),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pushNamed("/register");
                                    },
                                    child: const Text('Register'),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
            isLoading
                ? const SpinKitChasingDots(
                    size: 20,
                    color: Colors.cyan,
                  )
                : SizedBox(),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: mainColor),
    );
  }

  bool validateInput() {
    bool isvalid = true;
    if (emailCtr.value.text.isEmpty) {
      setState(() {
        errorEmailText = "Email should not be empty.";
        isInputValid = false;
      });
      isvalid = false;
    }

    if (passwordCtr.value.text.isEmpty) {
      setState(() {
        errorPasswordText = "Password should not be empty.";
        isInputValid = false;
      });
      return false;
    }

    if (passwordCtr.value.text.length < 8) {
      setState(() {
        errorPasswordText = "Password should contain 8 or more characters.";
        isInputValid = false;
      });
      return false;
    }

    return true;
  }

  Future<void> _handleLogin() async {
    if (!validateInput()) {
      return;
    }
    setState(() {
      isLoading = true;
    });

    final loggedinUser =
        await AuthenticationViewModel().login(emailCtr.text, passwordCtr.text);
    if (loggedinUser != null) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("token", loggedinUser.token);
      await UserViewModel().whoAmI(loggedinUser.token);
      // Restart.restartApp(webOrigin: "/");
      // UserViewModel().setLoggedinUser(loggedinUser);
      Navigator.of(context, rootNavigator: true)
          .pushNamedAndRemoveUntil("/homeScreen", (route) => false);
    } else {
      Fluttertoast.showToast(
          msg: "Login Failed. Try again later!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.cyan);
      log("LOGIN FAILED");
    }
    setState(() {
      isLoading = false;
    });
    // log("loggedinUser: " + loggedinUser.email);
  }
}
