import 'package:flutter/material.dart';
import 'package:flyket/model/apis/user.dart';
import 'package:flyket/model/transaction_history/transaction_history.dart';
import 'package:flyket/view/screen/user_notification/user_notification.dart';
import 'package:flyket/view/utils/date_format.dart';
import 'package:flyket/view/utils/currency_format.dart';
import 'package:flyket/viewmodel/user_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class TransactionHistoryDetail extends StatefulWidget {
  const TransactionHistoryDetail({super.key});

  @override
  State<TransactionHistoryDetail> createState() =>
      _TransactionHistoryDetailState();
}

class _TransactionHistoryDetailState extends State<TransactionHistoryDetail> {
  final mainColor = const Color(0xff02929A);
  final secondColor = const Color.fromARGB(158, 117, 161, 163);

  int transactionId = 1;
  late SharedPreferences prefs;

  late TransactionHistoryObj transaction = TransactionHistoryObj(
      id: 1,
      flightNo: '',
      invoiceNumber: '',
      transactionTime: '2023-01-02T00:54:51.172Z',
      fromAirportName: '',
      fromAirportCode: '',
      toAirportName: '',
      toAirportCode: '',
      departureTime: '2023-01-02T00:54:51.172Z',
      arrivalTime: '2023-01-02T00:54:51.172Z',
      travelType: '',
      adultPass: 0,
      childPass: 0,
      price: 0,
      createdAt: '2023-01-02T00:54:51.172Z',
      tickets: [
        {
          'ticket_number': '',
          'seat_number': '',
          'checked_in': false,
          'ticket_pdf': '',
          'passenger': {'name': ''},
          'schedule': {
            'flight': {'fClass': ''}
          }
        }
      ],
      user: {
        'name': '',
        'email': ''
      });

  // void getTransactionId() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   transactionId = await prefs.getInt('transactionId') as int;
  //   setState(() {});
  // }

  void getDetailData() async {
    // getTransactionId();
    await TransactionHistoryObj.getTransactionDetail(transactionId)
        .then((value) {
      transaction = value;
      setState(() {});
    });
  }

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) async {
      prefs = value;
      transactionId = await prefs.getInt('transactionId') as int;
      transaction =
          await TransactionHistoryObj.getTransactionDetail(transactionId);
      setState(() {});
    });
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // PAKE LIST VIEW BUILDER

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
                      // Navigator.pushNamed(context, "/notifications");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UserNotification(user: loggedInUser),
                        ),
                      );
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
                    "Transaction Detail",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Shows details transaction include list of all your tickets here",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                      "Buyer Name",
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(transaction.user['name']),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Buyer Email", style: TextStyle(fontSize: 10)),
                    Text(transaction.user['email']),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Transaction Time", style: TextStyle(fontSize: 10)),
                    Text(DateFormat.convertToDate(transaction.transactionTime)),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Invoice Number", style: TextStyle(fontSize: 10)),
                    Text(transaction.invoiceNumber),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Total Cost", style: TextStyle(fontSize: 10)),
                    Text(CurrencyFormat.convertToIdr(transaction.price, 2)),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Flight Number", style: TextStyle(fontSize: 10)),
                    Text(transaction.flightNo),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Departure", style: TextStyle(fontSize: 10)),
                    Text(
                        "${transaction.fromAirportName} (${transaction.fromAirportCode})"),
                    Text(DateFormat.convertToDate(transaction.departureTime)),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Arrival", style: TextStyle(fontSize: 10)),
                    Text(
                        "${transaction.toAirportName} (${transaction.toAirportCode})"),
                    Text(DateFormat.convertToDate(transaction.arrivalTime)),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Travel Type", style: TextStyle(fontSize: 10)),
                    Text(transaction.travelType)
                  ],
                )),
            ListView.builder(
              itemCount: transaction.tickets.length,
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
                                  Icons.airplane_ticket,
                                  color: mainColor,
                                ),
                                Text(
                                  " Ticket ${index + 1}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: mainColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Text(transaction.tickets[index]['schedule']
                                ['flight']['fClass'])
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
                                Text(
                                    transaction.tickets[index]['ticket_number'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Seat No.",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text("Passenger",
                                        style: TextStyle(fontSize: 12)),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      transaction.tickets[index]['seat_number'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                        transaction.tickets[index]['passenger']
                                            ['name'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ],
                            ),
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
                              (transaction.tickets[index]['checked_in'] == true
                                  ? 'Inactive'
                                  : 'Active'),
                              style: TextStyle(color: secondColor),
                            ),
                            InkWell(
                              onTap: () {
                                var url =
                                    transaction.tickets[index]['ticket_pdf'];
                                launchURL(url);
                              },
                              child: Text("Download Ticket",
                                  style: TextStyle(
                                    color: mainColor,
                                  )),
                            ),
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

  void launchURL(String urlStr) async {
    Uri url = Uri.parse(urlStr);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw "Couldn't launch $url";
    }
  }
}
