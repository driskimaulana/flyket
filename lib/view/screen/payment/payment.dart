import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(Payment());
}

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

  @override
  Widget build(BuildContext context) {
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
                    "Flyket",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
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
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      child: Row(
                        children: [
                          Text(paymentMethod[index - 2]),
                          Expanded(child: Text(" ")),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              child: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ],
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 10),
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
                            children: const [
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
