import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flyket/view/screen/main_navigation.dart';
import 'package:flyket/view/screen/onboarding/Onboarding.dart';
import 'package:flyket/viewmodel/airport_viewmodel.dart';
import 'package:flyket/viewmodel/user_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedin = false;

  Future<Null> checkIsLoggedin() async {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString("token");
    if (token != null) {
      Provider.of<UserViewModel>(context, listen: false).whoAmI(token);
      setState(() {
        isLoggedin = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    Provider.of<AirportListViewModel>(context, listen: false).fetchAirports();
    isLoggedin = false;
    checkIsLoggedin();

    Future.delayed(Duration(seconds: 5)).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              !isLoggedin ? const Onboarding() : MainNavigation(index: 0),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 113, 128),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/flyket.png",
              height: 50,
              width: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            SpinKitChasingDots(
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
