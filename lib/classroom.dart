import 'package:HandyTalk/common_screen.dart';
import 'package:flutter/material.dart';
import 'alphabet_screen.dart';
import 'numbers_screen.dart'; // Import the NumbersScreen

class ClassroomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(top: 75.0), // Adjust top padding here
        child: ListView(
          padding: EdgeInsets.zero, // Remove default ListView padding
          children: [
            ClassroomCard(
              image: Image.asset(
                'assets/images/sign_language.png',
                width: 50.0, // Set your desired width here
                height: 50.0, // Set your desired height here
              ),
              title: 'Sign Language',
              subtitle: 'Learn Sign Language',
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            ClassroomCard(
              image: Image.asset(
                'assets/images/alphabet.png',
                width: 50.0,
                height: 50.0,
              ),
              title: 'Alphabet',
              subtitle: 'Learn Sign Language Alphabet',
              color: Colors.red,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlphabetScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            ClassroomCard(
              image: Image.asset(
                'assets/images/common_words.png',
                width: 50.0, // Set your desired width here
                height: 50.0, // Set your desired height here
              ),
              title: 'Common Words',
              subtitle: 'Learn Sign Language Common Words',
              color: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommonScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            ClassroomCard(
              image: Image.asset(
                'assets/images/numbers.png',
                width: 50.0, // Set your desired width here
                height: 50.0, // Set your desired height here
              ),
              title: 'Numbers',
              subtitle: 'Learn Sign Language Numbers',
              color: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NumbersScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ClassroomCard extends StatelessWidget {
  final IconData? icon;
  final Image? image;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback? onTap; // Add onTap callback

  ClassroomCard({
    this.icon,
    this.image,
    required this.title,
    required this.subtitle,
    required this.color,
    this.onTap, // Receive onTap callback
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Execute onTap callback when card is tapped
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        width: MediaQuery.of(context).size.width - 40,
        height: 130.0,
        decoration: BoxDecoration(
          color: Color(0xFFCAF0F8).withOpacity(0.35),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            if (image != null)
              Padding(
                padding: EdgeInsets.all(20.0),
                child: image!,
              )
            else
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Icon(icon, color: color),
              ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
