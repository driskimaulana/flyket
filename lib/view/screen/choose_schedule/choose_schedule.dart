import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flyket/model/apis/user.dart';
import 'package:flyket/model/schedule/flight.dart';
import 'package:flyket/model/schedule/schedule.dart';
import 'package:flyket/model/schedule/search_scheadule.dart';
import 'package:flyket/view/screen/passanger_form/passanger_form.dart';
import 'package:flyket/view/screen/payment/payment.dart';
import 'package:flyket/view/screen/user_notification/user_notification.dart';
import 'package:flyket/viewmodel/schedules_viewmodel.dart';
import 'package:flyket/viewmodel/user_viewmodel.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseSchedule extends StatefulWidget {
  SearchScheadule searchSchedule;

  ChooseSchedule({super.key, required this.searchSchedule});

  @override
  State<ChooseSchedule> createState() => _ChooseScheduleState();
}

class _ChooseScheduleState extends State<ChooseSchedule> {
  final mainColor = const Color(0xff02929A);

  late List<Flight> flightList = [
    Flight(
        airlines: "Garuda Indonesia",
        flightTime: "12:00",
        landTime: "14:00",
        price: "1000000"),
    Flight(
        airlines: "Garuda Indonesia",
        flightTime: "11:00",
        landTime: "13:00",
        price: "1400000"),
    Flight(
        airlines: "Garuda Indonesia",
        flightTime: "14:00",
        landTime: "18:00",
        price: "1200000"),
  ];

  ScheduleViewModel? schedule;

  Flight? flight;

  List<ScheduleViewModel>? schedules = null;
  List<String> departureTimes = [];
  List<String> arrivalTimes = [];

  void fetchScheduleList() async {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString("token")!;
    final results = await ScheduleListViewModel().fetchScheduleList(
        widget.searchSchedule.departureDate,
        widget.searchSchedule.fromId,
        widget.searchSchedule.toId,
        widget.searchSchedule.passanger,
        token);
    setState(() {
      schedules = results;
      for (var i = 0; i < schedules!.length; i++) {
        DateTime departureParse = DateTime.parse(schedules![i].departureTime);
        DateTime arrivalParse = DateTime.parse(schedules![i].arrivalTime);

        departureTimes.add(DateFormat().add_Hm().format(departureParse));
        arrivalTimes.add(DateFormat().add_Hm().format(arrivalParse));
      }
    });

    DateTime parsed = DateTime.parse(schedules![1].departureTime);
    log("departure: ${DateFormat.jm().format(parsed)}");
    log("departure times: ${departureTimes[0]}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchScheduleList();

    // log("code: ${schedules[0].code}");
  }

  @override
  Widget build(BuildContext context) {
    // PAKE LIST VIEW BUILDER
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
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              // "${day}, ${widget.searchSchedule.departureDate}",
                              "${day}, $tanggal $bulan $tahun",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.searchSchedule.fromAirportCode
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward,
                                  size: 13,
                                ),
                                Text(
                                  widget.searchSchedule.toAirportCode
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        if (schedule != null)
                          Card(
                            elevation: 1,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  schedule!.code,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/gaindo.png",
                                  width: 60,
                                  height: 30,
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     const SizedBox(
                                //       width: 10,
                                //     ),
                                //     Text(
                                //       flight!.flightTime,
                                //       style: TextStyle(
                                //         fontSize: 14,
                                //         color: mainColor,
                                //       ),
                                //     ),
                                //     const SizedBox(
                                //       width: 10,
                                //     ),
                                //     Icon(
                                //       Icons.flight_takeoff,
                                //       color: mainColor,
                                //       size: 13,
                                //     ),
                                //     const SizedBox(
                                //       width: 10,
                                //     ),
                                //     Text(
                                //       flight!.landTime,
                                //       style: TextStyle(
                                //         fontSize: 14,
                                //         color: mainColor,
                                //       ),
                                //     ),
                                //     const SizedBox(
                                //       width: 10,
                                //     ),
                                //   ],
                                // ),
                                Text(
                                  "Rp ${schedule!.cost} / pax",
                                  style: const TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    if (schedule != null)
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(mainColor),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // builder: (context) => Payment(),
                                builder: (context) => PassangerForm(
                                  searchScheadule: widget.searchSchedule,
                                  scheduleId: schedule!.id,
                                  cost: schedule!.cost,
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  schedules == null
                      ? const SpinKitChasingDots(
                          size: 20,
                          color: Colors.cyan,
                        )
                      : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: schedules?.length,
                          itemBuilder: ((context, index) {
                            return Card(
                              elevation: 5,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    schedules != null
                                        ? schedules![index].code
                                        : "",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/gaindo.png",
                                    width: 60,
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        departureTimes.length != 0
                                            ? departureTimes[index]
                                            : "",
                                        style: TextStyle(
                                          fontSize: 26,
                                          color: mainColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Icon(
                                        Icons.flight_takeoff,
                                        color: mainColor,
                                        size: 13,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        arrivalTimes.length != 0
                                            ? arrivalTimes[index]
                                            : "",
                                        style: TextStyle(
                                          fontSize: 26,
                                          color: mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Rp ${schedules != null ? schedules![index].cost : ""} / pax",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: ElevatedButton(
                                      child: const Text(
                                        "Choose",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          schedule = schedules![index];
                                          // flight = flightList[index];
                                        });
                                        // print(flight!.price.toString());
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
