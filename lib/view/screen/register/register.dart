import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flyket/viewmodel/authentication_viewmodel.dart';

class RegisterPage extends StatefulWidget {
  static const nameRoute = '/homepage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final mainColor = const Color(0xff02929A);

  var isLoading = false;

  bool isInputValid = true;
  String? errorNameText = null;
  String? errorEmailText = null;
  String? errorPasswordText = null;

  final fullNameCtr = TextEditingController();
  final emailCtr = TextEditingController();
  final passwordCtr = TextEditingController();

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
                                  "Register",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(top: 10),
                                    child: const Text(
                                      "Create acccount to start your exploration.",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: TextField(
                                    autofocus: true,
                                    controller: fullNameCtr,
                                    cursorColor: Colors.amber,
                                    showCursor: true,
                                    autocorrect: false,
                                    textAlignVertical: TextAlignVertical.bottom,
                                    // textCapitalization:
                                    //     TextCapitalization.characters,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      errorText:
                                          !isInputValid ? errorNameText : null,
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff02929A))),
                                      prefixIcon: Icon(
                                        Icons.person,
                                        size: 25,
                                      ),
                                      hintText: "Fullname",
                                      labelText: "Fullname",
                                      // labelStyle: TextStyle(color: Color(0xff02929A)),
                                    ),
                                  ),
                                ),
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
                                      errorText:
                                          !isInputValid ? errorEmailText : null,
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff02929A))),
                                      prefixIcon: Icon(
                                        Icons.email,
                                        size: 25,
                                      ),
                                      hintText: "Your Email Address",
                                      labelText: "Email",
                                      // labelStyle: TextStyle(color: Color(0xff02929A)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: TextField(
                                    autofocus: true,
                                    controller: passwordCtr,
                                    cursorColor: Colors.amber,
                                    showCursor: true,
                                    autocorrect: false,
                                    textAlignVertical: TextAlignVertical.bottom,
                                    // textCapitalization:
                                    //     TextCapitalization.characters,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
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
                                    onPressed: _handleRegister,
                                    child: const Text('Register'),
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(top: 10),
                                    child: const Text(
                                      "Already have an acoount in Flyket?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                    )),
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(top: 2),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Color(0xff02929A),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pushNamed("/login");
                                    },
                                    child: const Text('Login'),
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
    if (fullNameCtr.value.text.isEmpty) {
      setState(() {
        errorNameText = "Fullname should not be empty.";
        isInputValid = false;
      });
      return false;
    }
    if (emailCtr.value.text.isEmpty) {
      setState(() {
        errorEmailText = "Email should not be empty.";
        isInputValid = false;
      });
      return false;
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

  Future<void> _handleRegister() async {
    if (!validateInput()) {
      return;
    }
    setState(() {
      isLoading = true;
    });

    final isRegisterSuccess = await AuthenticationViewModel()
        .register(fullNameCtr.text, emailCtr.text, passwordCtr.text);

    log(isRegisterSuccess.toString());

    if (isRegisterSuccess) {
      Navigator.of(context, rootNavigator: true)
          .pushNamedAndRemoveUntil("/login", (route) => false);
    } else {
      Fluttertoast.showToast(
        msg: "Register Failed. Try again later.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.cyan,
      );
    }

    setState(() {
      isLoading = false;
    });
  }
}
