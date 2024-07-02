import 'dart:async';
import 'package:flutter/material.dart';
import 'home.dart';
import 'settings.dart';
import 'premium_screen.dart'; // Import the PremiumScreen
import 'messages.dart';

void navigateToProfileSettings(BuildContext context) {}

void navigateToNotification() {}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    MessagesPage(),
    Home(),
    ClassroomPage(),
    GamesPage(),
    Settings(),
  ];

  @override
  void initState() {
    super.initState();
    // Navigate to PremiumScreen after 2 seconds
    Timer(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PremiumScreen()),
      );
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String appBarTitle;
    String profileImagePath;
    String notificationImagePath;

    if (_selectedIndex == 1) {
      appBarTitle = 'Messages';
      profileImagePath = 'assets/images/default-notification.png';
      notificationImagePath = 'assets/images/default-notification.png';
    } else if (_selectedIndex == 2) {
      appBarTitle = 'Classroom';
      profileImagePath = 'assets/images/default-notification.png';
      notificationImagePath = 'assets/images/default-notification.png';
    } else if (_selectedIndex == 3) {
      appBarTitle = 'Games';
      profileImagePath = 'assets/images/default-notification.png';
      notificationImagePath = 'assets/images/default-notification.png';
    } else if (_selectedIndex == 4) {
      appBarTitle = 'Settings';
      profileImagePath = 'assets/images/default-notification.png';
      notificationImagePath = 'assets/images/default-notification.png';
    } else {
      appBarTitle = 'Hello, Kavindu';
      profileImagePath = 'assets/images/profile-picture-icon.png';
      notificationImagePath =
          'assets/images/notification-icon-without-notification.png';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (_selectedIndex > 0) {
                  navigateToProfileSettings(context);
                }
              },
              child: Image.asset(
                profileImagePath,
                width: 40,
                height: 40,
              ),
            ),
            Text(
              appBarTitle,
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.black.withOpacity(0.75),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {
                navigateToNotification();
              },
              child: Image.asset(
                notificationImagePath,
                width: 30,
                height: 30,
              ),
            ),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: Color(0xFF0077B6),
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_rounded),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_rounded),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded),
              label: 'Classroom',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.gamepad_rounded),
              label: 'Games',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

class ClassroomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Classroom Page'));
  }
}

class GamesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Games Page'));
  }
}
