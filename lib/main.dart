import 'package:flutter/material.dart';
import 'package:flyket/model/schedule/search_scheadule.dart';
import 'package:flyket/view/screen/choose_schedule/choose_schedule.dart';
import 'package:flyket/view/screen/home/home_screen.dart';

import 'package:flyket/view/screen/onboarding/Onboarding.dart';
import 'package:flyket/view/screen/passanger_form/passanger_form.dart';
import 'package:flyket/view/screen/splashScreen/splash_screen.dart';
import 'package:flyket/viewmodel/airport_viewmodel.dart';
import 'package:provider/provider.dart';

import 'package:flyket/view/screen/user_notification/user_notification.dart';
import 'package:flyket/view/screen/passanger_form/passanger_form.dart';
import 'package:flyket/view/screen/transaction_history/transaction_history.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AirportListViewModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      // home: const HomeScreen(),
      // home: PassangerForm(),
      // home: const Onboarding(),
      // home: const SplashScreen(),
      // home: const SplashScreen(),
      home: const TransactionHistory(),

      // home: ChooseSchedule(
      //   searchFlight: new SearchScheadule(
      //       fromAirport: "Jakarta",
      //       toAirport: "Bangkok",
      //       passanger: 3,
      //       departureDate: "2022-12-30",
      //       seatClass: "Business"),
      // ),
    );
  }
}
