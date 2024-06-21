import 'package:flutter/material.dart';

void navigateToProfileSettings() {}

void navigateToNotification() {}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 710.0,
            left: 0,
            right: 290,
            child: Center(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    navigateToProfileSettings();
                  },
                  child: Image.asset(
                    'assets/images/profile-picture-icon.png',
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 718.0,
            left: 82,
            right: 0,
            child: Text(
              'Hello, Kavindu',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.black.withOpacity(0.75),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 715.0,
            left: 295,
            right: 0,
            child: Center(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    navigateToNotification();
                  },
                  child: Image.asset(
                    'assets/images/notification-icon-without-notification.png',
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent, // Change the background color
          selectedItemColor:
              Color(0xFF0077B6), // Change the color of the selected item
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
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
          ]),
    );
  }
}
