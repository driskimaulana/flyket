import 'package:flutter/material.dart';
import 'package:flyket/main.dart';

class UserNotification extends StatefulWidget {
  const UserNotification({super.key});

  @override
  State<UserNotification> createState() => _UserNotificationState();
}

class _UserNotificationState extends State<UserNotification> {
  final mainColor = const Color(0xff02929A);
  final secondColor = const Color.fromARGB(158, 117, 161, 163);

  @override
  Widget build(BuildContext context) {
    // PAKE LIST VIEW BUILDER

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "FlyTicket",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      "assets/images/profile.png",
                      width: 30,
                      height: 30,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: secondColor, blurRadius: 1.5, offset: Offset(0, 1))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Notification",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                color: Color.fromARGB(255, 211, 219, 223),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Unread First",
                      style: TextStyle(fontSize: 10, color: Colors.black54),
                    ),
                    Text(
                      "Mark All As Read",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(221, 214, 16, 2)),
                    )
                  ],
                ),
              ),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: ((context, index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(250, 250, 250, 250),
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.blueGrey, width: 0.5))),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.circle_notifications_rounded,
                                color: mainColor,
                                size: 35,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                runSpacing: 4,
                                children: [
                                  Text(
                                    "Payment successful!",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Thank you. Payment of IDR 5,000,000 for transaction A-123-T123 via BNI has been successful.",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black87),
                                  ),
                                  Text(
                                    "2022-12-27 13:50:58",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black45),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
