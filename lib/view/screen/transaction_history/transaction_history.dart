import 'package:flutter/material.dart';
import 'package:flyket/main.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
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
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: secondColor,
                          blurRadius: 1.5,
                          offset: Offset(0, 1))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Transaction History",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Shows all your transaction history in order from the newest",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                )),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: ((BuildContext context, int index) {
                return Card(
                    child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        padding: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: secondColor,
                                  blurRadius: 0,
                                  offset: Offset(0, 0.5))
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.flight,
                                  color: mainColor,
                                ),
                                Text(
                                  " GA-123",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: mainColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.more_vert,
                              color: secondColor,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Wrap(
                          runSpacing: 4,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("LC4STNMD-YH6E03F699M"),
                                Text(
                                  "2022-12-26 12:51:51",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "CGK",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("2023-01-15 08:00:00",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Column(
                                  children: [Icon(Icons.arrow_right_alt)],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "HND",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("2023-01-15 12:00:00",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500)),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Round Trip",
                                    style: TextStyle(fontSize: 12)),
                                Text("2 Dewasa, 1 Anak",
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Rp40.000.000,00",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: secondColor,
                                  blurRadius: 0,
                                  offset: Offset(0, -0.5))
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Active",
                              style: TextStyle(color: secondColor),
                            ),
                            Text("See Detail",
                                style: TextStyle(
                                  color: mainColor,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
              }),
            )
          ],
        ),
      ),
    );
  }
}
