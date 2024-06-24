import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


void navigateToProfileSettings(BuildContext context) {}

void navigateToNotification() {}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    MessagesPage(),
    ClassroomPage(),
    GamesPage(),
    SettingsPage(),
  ];

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

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 120, // Adjust this value to change the vertical position
          left: 16, // Adjust this value to change the horizontal position
          right: 16, // Adjust this value to change the horizontal position
          child: SearchBar(),
        ),
      ],
    );
  }
}

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Messages Page'));
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

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Settings Page'));
  }
}

class SearchBar extends StatefulWidget {
  final double width;
  final double height;

  SearchBar({this.width = 300.0, this.height = 50.0});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final ImagePicker _picker = ImagePicker();
  bool _animate = false;

  void _openCamera() async {
    setState(() {
      _animate = true;
    });

    await Future.delayed(Duration(seconds: 2));

    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _animate = false;
    });

    // Handle the photo if needed
    if (photo != null) {
      print('Photo captured: ${photo.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: Color(0x1ACAF0F8), // #CAF0F8 with 10% opacity
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // #000000 with 20% opacity
            offset: Offset(1, 1),
            blurRadius: 50,
            spreadRadius: 2,
          ),
        ],
        border: Border.all(
          color: Colors.black.withOpacity(0.025), // Black color with 5% opacity
          width: 1.0, // Width of the border
        ),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search_rounded,
            color: Colors.black.withOpacity(0.5), // 50% opacity
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
              ),
            ),
          ),
          GestureDetector(
            onTap: _openCamera,
            child: Icon(
              Icons.camera_alt_rounded,
              color: Colors.black.withOpacity(0.7), // 70% opacity
            ),
          ),
          SizedBox(width: 10.0), // Space between camera and mic icon
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF0077B6), // Circle color #0077B6
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(
                8.0), // Adjust padding to control the size of the circle
            child: Icon(
              Icons.mic,
              color: Colors.white, // Mic icon color
              size: 16.0, // Mic icon size
            ),
          ),
        ],
      ),
    );
  }
}
