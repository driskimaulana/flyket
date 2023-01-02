import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flyket/model/apis/user.dart';
import 'package:flyket/model/schedule/search_scheadule.dart';
import 'package:flyket/model/transactions/transanction.dart';
import 'package:flyket/view/screen/main_navigation.dart';
import 'package:flyket/viewmodel/transaction_viewmodel.dart';
import 'package:flyket/viewmodel/user_viewmodel.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Payment extends StatefulWidget {
  Transaction transaction;
  SearchScheadule searchSchedule;
  int cost;
  Payment(
      {super.key,
      required this.transaction,
      required this.searchSchedule,
      required this.cost});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final mainColor = const Color(0xff02929A);
  final List paymentMethod = [
    "INDOMARET",
    "ALFAMART",
    "DANA",
    "SHOPEEPAY",
    "OVO"
  ];

  int activePayment = -1;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var date = DateTime.parse(widget.searchSchedule.departureDate);
    String day = DateFormat("EEEE").format(date);
    String tanggal = DateFormat("d").format(date);
    String bulan = DateFormat("MMMM").format(date);
    String tahun = DateFormat("y").format(date);

    var uvm = context.read<UserViewModel>();

    // get logged in user data from provider
    User loggedInUser = uvm.user;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
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
                    "Flyket",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/notifications");
                    },
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
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
        child: Stack(
          children: [
            Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return ListTile(
                        title: Text("Metode Pembayaran",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      );
                    } else if (index == 1) {
                      return ListTile(
                        title: Text(
                          "Rekomendasi Metode Pembayaran",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        subtitle: Text(
                            "Nikmati benefit ekstra dengan metode pembayaran rekomendasi dari Flyket.com"),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Card(
                          color: activePayment == index
                              ? Color(0xff02929A)
                              : Colors.white,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                activePayment = index;
                              });
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  paymentMethod[index - 2],
                                  style: TextStyle(
                                    color: activePayment == index
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                Expanded(child: Text(" ")),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: activePayment == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  itemCount: paymentMethod.length + 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Penerbangan",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    widget.searchSchedule.fromAirport,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 9,
                                  ),
                                  Text(
                                    widget.searchSchedule.toAirport,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/gaindo.png",
                                    width: 60,
                                    height: 30,
                                  ),
                                  Text(
                                    "${day}, $tanggal $bulan $tahun",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.payment,
                              size: 14,
                              color: Color.fromARGB(255, 176, 26, 15),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Rp ${(widget.searchSchedule.passanger * widget.cost).toString()}",
                              style: const TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 176, 26, 15),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(mainColor),
                            ),
                            onPressed: () {
                              _handlePay(loggedInUser.token);
                            },
                            child: const Text(
                              "Pay",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            isLoading
                ? Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 2 - 100),
                    child: const SpinKitChasingDots(
                      size: 20,
                      color: Colors.cyan,
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  void _handlePay(String token) async {
    log(widget.transaction.biodataList.toString());
    setState(() {
      isLoading = true;
    });
    final isSuccess = await TransactionViewModel()
        .createTransaction(widget.transaction, token);
    if (isSuccess) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          "/homeScreen2", (Route<dynamic> route) => false);
    } else {
      Fluttertoast.showToast(
          msg: "Failed to Pay. Not Enough Balance",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.cyan);
    }
    setState(() {
      isLoading = true;
    });
  }
}
