import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flyket/model/schedule/flight.dart';
import 'package:flyket/model/schedule/schedule.dart';
import 'package:flyket/model/schedule/search_scheadule.dart';
import 'package:flyket/view/screen/payment/payment.dart';
import 'package:flyket/viewmodel/schedules_viewmodel.dart';
import 'package:intl/intl.dart';

class ChooseSchedule extends StatefulWidget {
  SearchScheadule searchFlight;

  ChooseSchedule({super.key, required this.searchFlight});

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

  Flight? flight;

  late List<ScheduleViewModel> schedules;

  void fetchScheduleList() async {
    final results = await ScheduleListViewModel().fetchScheduleList(widget.searchFlight.departureDate, widget.searchFlight.fromId, widget.searchFlight.toId, widget.searchFlight.passanger);
    setState(() {
      schedules = results;
    });

    log("schedules: ${schedules[0].code}");
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
    var date = DateTime.parse(widget.searchFlight.departureDate);
    String day = DateFormat("EEEE").format(date);
    String tanggal = DateFormat("d").format(date);
    String bulan = DateFormat("MMMM").format(date);
    String tahun = DateFormat("y").format(date);

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
                              // "${day}, ${widget.searchFlight.departureDate}",
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
                                  widget.searchFlight.fromAirportCode
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
                                  widget.searchFlight.toAirportCode.toString(),
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
                        if (flight != null)
                          Card(
                            elevation: 1,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  flight!.airlines,
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      flight!.flightTime,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: mainColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.flight_takeoff,
                                      color: mainColor,
                                      size: 13,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      flight!.landTime,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: mainColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                                Text(
                                  "Rp ${flight!.price} / pax",
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
                    if (flight != null)
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
                                    builder: (context) => Payment()));
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
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: flightList.length,
                itemBuilder: ((context, index) {
                  return Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          flightList[index].airlines,
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
                              flightList[index].flightTime,
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
                              flightList[index].landTime,
                              style: TextStyle(
                                fontSize: 26,
                                color: mainColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Rp ${flightList[index].price} / pax",
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
                                flight = flightList[index];
                              });
                              print(flight!.price.toString());
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
            ),
          ],
        ),
      ),
    );
  }
}
