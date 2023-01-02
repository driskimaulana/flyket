import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flyket/model/apis/user.dart';
import 'package:flyket/model/user_profile/user_profile.dart';
import 'package:flyket/viewmodel/user_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final mainColor = const Color(0xff02929A);

  // late UserProfileObj user;
  // var userId = 1;

  @override
  void initState() {
    super.initState();
    // UserProfileObj.getUser(userId).then((value) {
    //   user = value;
    //   print(user);
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    var uvm = context.read<UserViewModel>();

    // get logged in user data from provider
    User loggedInUser = uvm.user;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                  loggedInUser.name,
                  // "${user.name}",
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
                          TextButton(
                            onPressed: (() {
                              Fluttertoast.showToast(
                                msg: "Account Clicked",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                backgroundColor: Colors.cyan,
                              );
                            }),
                            child: Row(
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
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextButton(
                            onPressed: (() {
                              Fluttertoast.showToast(
                                msg: "My Orders Clicked",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                backgroundColor: Colors.cyan,
                              );
                            }),
                            child: Row(
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
                          ),
                          loggedInUser.role != "user"
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, "/dashboardAdmin");
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.admin_panel_settings,
                                          color: mainColor,
                                          size: 35,
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Text(
                                          "Dashboard Admin",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextButton(
                            onPressed: _handleLogout,
                            child: Row(
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
                            loggedInUser.name,
                            // "${user.name}",
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
                            "Balance",
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                          Text(
                            // "Bang Asep",
                            loggedInUser.balance.toString(),
                            // "${user.name}",
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
                            // "${user.email}",
                            loggedInUser.email,
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
                            "Account Type",
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                          Text(
                            // "+62888888111",
                            loggedInUser.role,
                            // "${user.telp}",
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogout() async {
    Fluttertoast.showToast(
      msg: "Processing Logout ...",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.cyan,
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    Restart.restartApp(webOrigin: "/");
  }
}
