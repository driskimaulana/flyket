import 'package:flutter/material.dart';
import 'package:flyket/model/schedule/search_scheadule.dart';
import 'package:flyket/view/screen/admin_dashboard/admin_dashboard.dart';
import 'package:flyket/view/screen/choose_schedule/choose_schedule.dart';
import 'package:flyket/view/screen/home/home_screen.dart';
import 'package:flyket/view/screen/login/login.dart';
import 'package:flyket/view/screen/main_navigation.dart';

import 'package:flyket/view/screen/onboarding/Onboarding.dart';
import 'package:flyket/view/screen/passanger_form/passanger_form.dart';
import 'package:flyket/view/screen/register/register.dart';
import 'package:flyket/view/screen/splashScreen/splash_screen.dart';
import 'package:flyket/viewmodel/airport_viewmodel.dart';
import 'package:provider/provider.dart';

import 'package:flyket/view/screen/user_notification/user_notification.dart';
import 'package:flyket/view/screen/passanger_form/passanger_form.dart';

import 'package:flyket/view/screen/transaction_history/transaction_history.dart';
import 'package:flyket/view/screen/transaction_history/transaction_detail.dart';

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
      routes: {
        // "/": (context) => SplashScreen(),
        "/": (context) => TransactionHistoryDetail(),
        "/onboarding": (context) => Onboarding(),
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        "/homeScreen": (context) => MainNavigation(
              index: 0,
            ),
        "/transactionHistory": (context) => TransactionHistory(),
        "/notifications": (context) => UserNotification(),
      },
      initialRoute: "/",
    );
  }
}
