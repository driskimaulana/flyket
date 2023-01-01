import 'package:flutter/material.dart';
import 'package:flyket/view/screen/home/home_screen.dart';
import 'package:flyket/view/screen/transaction_history/transaction_history.dart';
import 'package:flyket/view/screen/user_profile/user_profile.dart';

class MainNavigation extends StatefulWidget {
  int index;
  MainNavigation({super.key, required this.index});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  final mainColor = const Color(0xff02929A);

  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    const List<Widget> _pages = [
      HomeScreen(),
      TransactionHistory(),
      UserProfile(),
    ];

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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: _pages.elementAt(currentIndex),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
