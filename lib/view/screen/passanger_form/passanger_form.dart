import 'package:flutter/material.dart';
import 'package:flyket/model/apis/user.dart';
import 'package:flyket/model/schedule/search_scheadule.dart';
import 'package:flyket/model/transactions/passanger.dart';
import 'package:flyket/model/transactions/transanction.dart';
import 'package:flyket/view/screen/payment/payment.dart';
import 'package:flyket/view/screen/user_notification/user_notification.dart';
import 'package:flyket/viewmodel/user_viewmodel.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PassangerForm extends StatefulWidget {
  SearchScheadule searchScheadule;
  int scheduleId, cost;

  PassangerForm(
      {super.key,
      required this.searchScheadule,
      required this.scheduleId,
      required this.cost});

  @override
  State<PassangerForm> createState() => PassangerFormState();
}

class PassangerFormState extends State<PassangerForm> {
  final mainColor = const Color(0xff02929A);

  List<Passanger> passangersData = <Passanger>[];

  List<TextEditingController> telpCtrs = <TextEditingController>[];
  List<TextEditingController> nameCtrs = <TextEditingController>[];
  List<TextEditingController> nikCtrs = <TextEditingController>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (var i = 0; i < widget.searchScheadule.passanger; i++) {
      telpCtrs.add(TextEditingController());
      nikCtrs.add(TextEditingController());
      nameCtrs.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    var date = DateTime.parse(widget.searchScheadule.departureDate);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListView.builder(
              itemCount: widget.searchScheadule.passanger,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Passanger ${index + 1}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 300,
                        height: 60,
                        child: TextField(
                          controller: nikCtrs[index],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            // icon: Icon(Icons.people),
                            label: Text("NIK"),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 300,
                        height: 60,
                        child: TextField(
                          controller: telpCtrs[index],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            // icon: Icon(Icons.people),
                            label: Text("Telepon"),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 300,
                        height: 60,
                        child: TextField(
                          controller: nameCtrs[index],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            // icon: Icon(Icons.people),
                            label: Text("Name"),
                          ),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                              widget.searchScheadule.fromAirport,
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
                              widget.searchScheadule.toAirport,
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
                        backgroundColor: MaterialStateProperty.all(mainColor),
                      ),
                      onPressed: () {
                        _handleToPayment(loggedInUser.id);
                      },
                      child: const Text(
                        "Continue to Payment",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleToPayment(int userId) {
    List<Map<String, Map<String, String>>> biodataList =
        <Map<String, Map<String, String>>>[];
    for (var i = 0; i < widget.searchScheadule.passanger; i++) {
      biodataList.add(<String, Map<String, String>>{
        "body": <String, String>{
          "nik": nikCtrs[i].text,
          "telp": telpCtrs[i].text,
          "name": nameCtrs[i].text,
        }
      });
    }
    Transaction transaction = Transaction(userId, [widget.scheduleId],
        widget.searchScheadule.passanger, 0, false, biodataList);

    Navigator.push(
      context,
      MaterialPageRoute(
        // builder: (context) => Payment(),
        builder: (context) => Payment(
          transaction: transaction,
          searchSchedule: widget.searchScheadule,
          cost: widget.cost,
        ),
      ),
    );
  }
}
