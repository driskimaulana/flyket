import 'package:flutter/material.dart';
import 'package:flyket/model/user_profile/user_profile.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final mainColor = const Color(0xff02929A);

  late UserProfileObj user;
  var userId = 1;

  @override
  void initState() {
    super.initState();
    UserProfileObj.getUser(userId).then((value) {
      user = value;
      print(user);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Column(
            children: [
              CircleAvatar(
                radius: 65.0,
                backgroundImage: AssetImage('assets/images/profile.png'),
                backgroundColor: Colors.white,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                // "Bang Asep",
                "${user.name}",
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w800,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Card(
              child: Container(
                  width: 310.0,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Information",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Divider(
                          color: Colors.grey[400],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.account_circle,
                              color: mainColor,
                              size: 35,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              "Account",
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.airplane_ticket_outlined,
                              color: mainColor,
                              size: 35,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              "My Orders",
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.logout,
                              color: mainColor,
                              size: 35,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              "Logout",
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))),
          SizedBox(
            height: 20.0,
          ),
          Card(
              child: Container(
                  width: 310.0,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Account",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Divider(
                          color: Colors.grey[400],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style:
                                  TextStyle(fontSize: 12.0, color: Colors.grey),
                            ),
                            Text(
                              // "Bang Asep",
                              "${user.name}",
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style:
                                  TextStyle(fontSize: 12.0, color: Colors.grey),
                            ),
                            Text(
                              "${user.email}",
                              // "asep@gmail.com",
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Phone Number",
                              style:
                                  TextStyle(fontSize: 12.0, color: Colors.grey),
                            ),
                            Text(
                              // "+62888888111",
                              "${user.telp}",
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}
