import 'package:HandyTalk/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'premium_screen.dart'; // Import the PremiumScreen

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with SingleTickerProviderStateMixin {
  File? _image;
  bool _isAnimating = false;
  late AnimationController _animationController;
  String _selectedLanguage = 'English - US';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _isAnimating = false;
          });
        }
      });
  }

  Future<void> _showAvatarDialog() async {
  final String? selectedAvatar = await showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Select Avatar'),
        backgroundColor: const Color(0xFFCAF0F8).withOpacity(0.9), // Suitable background color
        children: <Widget>[
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildAvatarOption(
                  context,
                  'assets/images/avatar_01.png',
                  'Buy',
                  Colors.green,
                ),
                _buildAvatarOption(
                  context,
                  'assets/images/avatar_02.png',
                  'Buy',
                  Colors.green,
                ),
                _buildAvatarOption(
                  context,
                  'assets/images/avatar_03.png',
                  'Premium',
                  Colors.red,
                ),
                _buildAvatarOption(
                  context,
                  'assets/images/avatar_04.png',
                  'Premium',
                  Colors.red,
                ),
                _buildAvatarOption(
                  context,
                  'assets/images/avatar_05.png',
                  'Premium',
                  Colors.red,
                ),
              ],
            ),
          ),
        ],
      );
    },
  );

  if (selectedAvatar != null) {
    setState(() {
      _image = File(selectedAvatar);
      _isAnimating = true;
      _animationController.forward(from: 0.0);
    });
  }
}

Widget _buildAvatarOption(BuildContext context, String imagePath, String label, Color labelColor) {
  return SimpleDialogOption(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PremiumScreen()),
      );
    },
    child: Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(imagePath, width: 50, height: 50),
        Positioned(
          bottom: 5,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            color: labelColor,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


  Future<void> _pickImage() async {
    _showAvatarDialog();
  }

  Future<void> _showLanguageDialog() async {
    final String? selectedLanguage = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Language'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'English - US');
              },
              child: const Text('English - US'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Sinhala');
              },
              child: const Text('Sinhala'),
            ),
          ],
        );
      },
    );

    if (selectedLanguage != null && selectedLanguage != _selectedLanguage) {
      setState(() {
        _selectedLanguage = selectedLanguage;
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          // Main content
          Positioned(
            top: 115,
            left: MediaQuery.of(context).size.width / 2 - 160,
            child: Container(
              width: 320,
              height: 250,
              decoration: BoxDecoration(
                color: const Color(0xFFCAF0F8).withOpacity(0.25),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.35),
                    offset: const Offset(0, 0),
                    blurRadius: 150,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Center(
                child: GestureDetector(
                  onLongPress: () {
                    setState(() {
                      _isAnimating = true;
                    });
                    _animationController.forward(from: 0.0);
                    Future.delayed(const Duration(seconds: 3), _pickImage);
                  },
                  onTap: _showAvatarDialog, // Add this line to handle tap
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 30,
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 3),
                          curve: Curves.easeInOut,
                          width: _isAnimating ? 80 : 60,
                          height: _isAnimating ? 80 : 60,
                          child: ClipOval(
                            child: _image == null
                                ? Image.asset(
                                    'assets/images/tempory_img.png',
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    _image!,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 110,
                        child: Text(
                          'Kavindu Malshan',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto-Bold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 130,
                        child: Text(
                          '@kavindu1125',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 12,
                            fontFamily: 'Roboto-Bold',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email,
                                color: Colors.black.withOpacity(0.75), size: 16),
                            const SizedBox(width: 8),
                            Text(
                              'kavindu11250403@gmail.com',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.75),
                                fontSize: 12,
                                fontFamily: 'Roboto-Bold',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              width: 80.0,
                              height: 20.0,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xFF4BFF2E)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                ),
                                child: const Text(
                                  'Verified',
                                  style: TextStyle(
                                      fontSize: 9,
                                      fontFamily: 'Roboto-Bold',
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 380,
            left: MediaQuery.of(context).size.width / 2 - 160,
            child: Container(
              width: 320,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFFCAF0F8).withOpacity(0.25),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.35),
                    offset: const Offset(0, 0),
                    blurRadius: 150,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('Language'),
                    subtitle: Text(_selectedLanguage),
                    onTap: _showLanguageDialog,
                  ),
                  ListTile(
                    leading: const Icon(Icons.notifications),
                    title: const Text('Communication Preferences'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 520,
            left: MediaQuery.of(context).size.width / 2 - 160,
            child: Container(
              width: 320,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFCAF0F8).withOpacity(0.25),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.35),
                    offset: const Offset(0, 0),
                    blurRadius: 150,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Log out'),
                    onTap: () {
                      _showLogoutConfirmation(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text('Delete Account'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Do you really want to log out?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            ElevatedButton(
              child: Text('Log Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Change button color
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
