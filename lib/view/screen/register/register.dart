import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  static const nameRoute = '/homepage';
  final mainColor = const Color(0xff02929A);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: 100,
                    padding: EdgeInsets.only(top: 30),
                    child:
                        Image(image: AssetImage('assets/images/logofull.png')),
                  ),
                  Container(
                    width: 230,
                    child:
                        Image(image: AssetImage('assets/images/loginImg.png')),
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
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(top: 10),
                                child: const Text(
                                  "Create acccount to start your exploration.",
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                )),
                            const Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: TextField(
                                autofocus: true,
                                cursorColor: Colors.amber,
                                showCursor: true,
                                autocorrect: false,
                                textAlignVertical: TextAlignVertical.bottom,
                                textCapitalization:
                                    TextCapitalization.characters,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff02929A))),
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
                            const Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: TextField(
                                autofocus: true,
                                cursorColor: Colors.amber,
                                showCursor: true,
                                autocorrect: false,
                                textAlignVertical: TextAlignVertical.bottom,
                                textCapitalization:
                                    TextCapitalization.characters,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff02929A))),
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
                            const Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: TextField(
                                autofocus: true,
                                cursorColor: Colors.amber,
                                showCursor: true,
                                autocorrect: false,
                                textAlignVertical: TextAlignVertical.bottom,
                                textCapitalization:
                                    TextCapitalization.characters,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff02929A))),
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
                                onPressed: () {},
                                child: const Text('Register'),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                                  padding: const EdgeInsets.only(top: 10),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Color(0xff02929A),
                                    ),
                                    onPressed: () {},
                                    child: const Text('Login'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: mainColor),
    );
  }
}
