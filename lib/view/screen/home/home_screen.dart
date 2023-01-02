// import 'package:dropdownfield/dropdownfield.dart';
import 'dart:developer';
// import 'dart:ffi';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';
import 'package:flyket/model/schedule/search_scheadule.dart';
import 'package:flyket/view/screen/choose_schedule/choose_schedule.dart';
import 'package:flyket/viewmodel/airport_viewmodel.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final mainColor = const Color(0xff02929A);

  final fromCtr = TextEditingController();
  final toCtr = TextEditingController();
  final noPassangerCtr = TextEditingController();

  int noPassanger = 0;

  final dateCtr = TextEditingController();

  late int from;

  @override
  void initState() {
    super.initState();
    dateCtr.text = "";
    fromCtr.text = "";
    toCtr.text = "";
    noPassangerCtr.text = "";
  }

  List<String> seatClasses = ["Economy", "Business", "First"];
  String seatClassSelected = "Economy";

  @override
  Widget build(BuildContext context) {
    var lvm = context.read<AirportListViewModel>();
    // get list of airport name
    List<dynamic> cities =
        lvm.airports.map((e) => "${e.citi} | ${e.name} | ${e.code} | ${e.id.toString()}").toList();

    // get list of airport id
    List<dynamic> ids = lvm.airports.map(((e) => e.id)).toList();

    log("lvm: " + lvm.airports.length.toString());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Image.asset("assets/images/sumba.jpg"),
                  const Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 250,
                        child: Text(
                          "Travelling Made Easy with Flyket",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                // Image.set("assets/images/sumba.jpg"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: DropDownField(
                controller: fromCtr,
                labelText: "From",
                hintText: "From",
                items: cities,
                value: ids,
                strict: true,
                itemsVisibleInDropdown: 2,
                icon: const Icon(
                  Icons.flight_takeoff,
                ),
                setter: (newValue) {
                  setState(() {
                    fromCtr.text = newValue;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: DropDownField(
                controller: toCtr,
                labelText: "To",
                hintText: "To",
                itemsVisibleInDropdown: 2,
                items: cities,
                value: ids,
                strict: true,
                icon: const Icon(
                  Icons.flight_land,
                ),
                setter: (newValue) {
                  toCtr.text = newValue;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              height: 60,
              child: TextField(
                controller: noPassangerCtr,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.people),
                  label: Text("No. of passanger"),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    noPassanger = int.parse(value);
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              height: 60,
              child: TextField(
                controller: dateCtr,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.calendar_month),
                  label: Text("Departure Date"),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030));

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    setState(() {
                      dateCtr.text = formattedDate;
                    });
                  }
                },
                onChanged: (valaue) {},
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              height: 60,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: const Text("Seat Class"),
                  items: seatClasses.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.flight_class,
                            color: Colors.black38,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(item),
                        ],
                      ),
                    );
                  }).toList(),
                  value: seatClassSelected,
                  onChanged: (value) {
                    setState(() {
                      seatClassSelected = value!;
                    });
                  },
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black38),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton(
                onPressed: _handleSearch,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(mainColor),
                ),
                child: const Text(
                  "Search Flight",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _handleSearch() {
    var to = toCtr.text.split("|");
    var from = fromCtr.text.split("|");
    log("to id: " + to.toString());
    log("from id: " + from[1].toString());
    SearchScheadule search = SearchScheadule(
      fromAirport: from[1],
      toAirport: to[1],
      fromId: int.parse(from[3]),
      toId: int.parse(to[3]),
      seatClass: seatClassSelected,
      departureDate: dateCtr.text,
      fromAirportCode: from[2],
      toAirportCode: to[2],
      passanger: noPassanger,
    );
    log("search: ${search.fromAirport.toString()}");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ChooseSchedule(searchFlight: search),),);
  }
}
