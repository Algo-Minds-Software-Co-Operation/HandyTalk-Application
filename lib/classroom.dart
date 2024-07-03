import 'package:flutter/material.dart';

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
          // Uncomment the gradient if needed
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [Color(0xFF9FE7FB), Color(0xFF85C7F2)],
          // ),
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
                width: 50.0, // Set your desired width here
                height: 50.0, // Set your desired height here
              ),
              title: 'Alphabet',
              subtitle: 'Learn Sign Language Alphabet',
              color: Colors.red,
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

  ClassroomCard({
    this.icon,
    this.image,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      width: MediaQuery.of(context).size.width - 40, // Decrease width by 40
      height: 130.0, // Adjusted height
      decoration: BoxDecoration(
        color: Color(0xFFCAF0F8)
            .withOpacity(0.35), // Set background color with opacity
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          if (image != null)
            Padding(
              padding: EdgeInsets.all(20.0),
              child: image,
            )
          else
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(icon, color: color),
            ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  right: 10.0), // Align text slightly to the right
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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
    );
  }
}
