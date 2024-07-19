import 'dart:async';
import 'package:flutter/material.dart';
import 'home.dart';
import 'settings.dart';
import 'premium_screen.dart'; // Import the PremiumScreen
import 'classroom.dart';
import 'games.dart';
import 'messages.dart';
import 'new_messages_screen.dart'; // Import the NewMessagePage
import 'coins_buy_screen.dart'; // Import the CoinsScreen
import 'edit_model.dart'; // Import the EditModel screen

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const MessagesPage(),
    const ClassroomPage(),
    const GamesPage(),
    const Settings(),
  ];

  @override
  void initState() {
    super.initState();
    // Navigate to PremiumScreen after 2 seconds
    Timer(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PremiumScreen()),
      );
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void navigateToProfileSettings(BuildContext context) {
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const EditModel()), // Navigate to EditModel screen
      );
    }
  }

  void navigateToNotification(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewMessagePage()),
    );
  }

  void navigateToCoinsScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CoinsScreen()),
    );
  }

  Widget _buildCoinsIcon() {
    return GestureDetector(
      onTap: () {
        navigateToCoinsScreen(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, color: Colors.white, size: 12),
            SizedBox(width: 2),
            Text(
              '100',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            Icon(Icons.monetization_on, color: Colors.yellow, size: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String appBarTitle;
    String profileImagePath;
    String notificationImagePath;

    if (_selectedIndex == 1) {
      appBarTitle = 'Messages';
      profileImagePath = 'assets/images/default-notification.png';
      notificationImagePath = 'assets/images/add-new-message.png';
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
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      if (_selectedIndex == 0)
        GestureDetector(
          onTap: () {
            navigateToProfileSettings(context); // Navigate to EditModel when tapping profile picture on Home page
          },
          child: Image.asset(
            profileImagePath,
            width: 40,
            height: 40,
          ),
        ),
      if (_selectedIndex == 0) const SizedBox(width: 10),
      Text(
        appBarTitle,
        style: TextStyle(
          fontFamily: 'Roboto',
          color: Colors.black.withOpacity(0.75),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      if (_selectedIndex == 0) const SizedBox(width: 10),
      if (_selectedIndex == 0) _buildCoinsIcon(),
    ],
  ),
  centerTitle: true,
  actions: [
    GestureDetector(
      onTap: () {
        navigateToNotification(context); // Pass context here
      },
      child: Image.asset(
        notificationImagePath,
        width: 30,
        height: 30,
      ),
    ),
  ],
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
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: const Color(0xFF0077B6),
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
