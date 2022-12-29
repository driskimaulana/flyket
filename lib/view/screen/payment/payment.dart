import 'package:flutter/material.dart';
import 'package:flyket/view/screen/main_navigation.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

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

  @override
  Widget build(BuildContext context) {
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(
                              "Penerbangan",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Jakarta",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 9,
                              ),
                              Text(
                                "Bangkok",
                                style: TextStyle(
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
                                "Friday, 30 December 2022",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.star,
                                size: 5,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "14:00",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(mainColor),
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainNavigation(index: 1),
                              ),
                              (route) => false);
                          // Navigator.pushAndRemoveUntil(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => MainNavigation(index: 1),
                          //   ),
                          // );
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
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
