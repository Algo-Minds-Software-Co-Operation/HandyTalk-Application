import 'package:flutter/material.dart';

void navigateToProfileSettings() {}

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
            bottom: 770.0,
            left: 0,
            right: 280,
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
            bottom: 768.0,
            left: 78,
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
            bottom: 768.0,
            left: 285,
            right: 0,
            child: Center(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    navigateToProfileSettings();
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
    );
  }
}
