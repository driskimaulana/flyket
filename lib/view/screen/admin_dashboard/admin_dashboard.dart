import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flyket/model/apis/summary.dart';
import 'package:flyket/view/screen/admin_dashboard/chart_number_passangers.dart';
import 'package:flyket/viewmodel/summary_viewmodel.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final mainColor = const Color(0xff02929A);

  late List<Summary> summaries = [];

  Future<Null> checkIsLoggedin() async {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString("token");
    if (token != null) {
      final response = await SummaryListViewModel().fetchSummary(token);

      setState(() {
        summaries = response;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Summary.fetchSummary().then((values) {
      summaries = values;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: mainColor,
        title: Row(
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
                    Navigator.pop(context);
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff02929A),
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                color: Color(0xff02929A),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(children: [
                Container(
                  child: Text(
                    'Welcome Admin',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                Container(
                  child: Text(
                    DateFormat.yMMMEd().format(DateTime.now()),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
              ]),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                'Number Passengers Destination Country',
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff02929A),
                    fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.only(bottom: 10, left: 20),
            ),
            summaries.length != 0
                ? Container(
                    padding: EdgeInsets.all(20),
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Text(
                                  summaries[0].name,
                                  style: TextStyle(
                                      color: Color(0xff02929A),
                                      fontWeight: FontWeight.bold),
                                ),
                                padding: EdgeInsets.only(right: 5),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                child: Text(
                                  summaries[1].name,
                                  style: TextStyle(
                                      color: Color(0xff02929A),
                                      fontWeight: FontWeight.bold),
                                ),
                                padding: EdgeInsets.only(bottom: 5),
                              ),
                              Container(
                                  child: CustomPaint(
                                painter: ChartPassenger(
                                  posX: 10,
                                  posY: 10,
                                  gleft: summaries[0].buyer,
                                  gtop: summaries[1].buyer,
                                  gright: summaries[4].buyer,
                                  gbottom: summaries[2].buyer,
                                ),
                                child: Container(
                                  width: 400,
                                  height: 400,
                                ),
                              )),
                              Container(
                                child: Text(
                                  summaries[2].name,
                                  style: TextStyle(
                                      color: Color(0xff02929A),
                                      fontWeight: FontWeight.bold),
                                ),
                                padding: EdgeInsets.only(top: 5),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                child: Text(
                                  summaries[3].name,
                                  style: TextStyle(
                                      color: Color(0xff02929A),
                                      fontWeight: FontWeight.bold),
                                ),
                                padding: EdgeInsets.only(left: 5),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                : const SpinKitChasingDots(
                    size: 20,
                    color: Colors.cyan,
                  ),
          ],
        ),
      ),
    );
  }
}
