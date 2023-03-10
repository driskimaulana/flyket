import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flyket/model/transaction_history/transaction_history.dart';
import 'package:flyket/view/screen/transaction_history/transaction_detail.dart';
import 'package:flyket/view/utils/date_format.dart';
import 'package:flyket/view/utils/currency_format.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  final mainColor = const Color(0xff02929A);
  final secondColor = const Color.fromARGB(158, 117, 161, 163);

  late List<TransactionHistoryObj> transactions = [];

  @override
  void initState() {
    super.initState();

    TransactionHistoryObj.getAllTransactions().then((values) {
      transactions = values;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Shows all your transaction history in order from the newest",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
            Stack(
              children: [
                ListView.builder(
                  itemCount: transactions.length,
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
                                      " ${transactions[index].flightNo}",
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(transactions[index].invoiceNumber),
                                    Text(
                                      DateFormat.convertToDate(
                                          transactions[index].transactionTime),
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          transactions[index].fromAirportCode,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                            DateFormat.convertToDate(
                                                transactions[index]
                                                    .departureTime),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    Column(
                                      children: [Icon(Icons.arrow_right_alt)],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          transactions[index].toAirportCode,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                            DateFormat.convertToDate(
                                                transactions[index]
                                                    .arrivalTime),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(transactions[index].travelType,
                                        style: TextStyle(fontSize: 12)),
                                    Text(
                                        "${transactions[index].adultPass} Dewasa, ${transactions[index].childPass} Anak",
                                        style: TextStyle(fontSize: 12)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                        CurrencyFormat.convertToIdr(
                                            transactions[index].price, 2),
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
                                InkWell(
                                    onTap: () async {
                                      final prefs =
                                          await SharedPreferences.getInstance();
                                      await prefs.setInt('transactionId',
                                          transactions[index].id);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TransactionHistoryDetail()));
                                    },
                                    child: Text("See Detail",
                                        style: TextStyle(
                                          color: mainColor,
                                        )))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ));
                  }),
                ),
                transactions.isEmpty
                    ? Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 2 - 100),
                        child: Column(
                          children: [
                            const SpinKitChasingDots(
                              size: 20,
                              color: Colors.cyan,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "You don't have any transactions.",
                              style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
