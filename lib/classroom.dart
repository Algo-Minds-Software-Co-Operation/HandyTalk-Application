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
        
        padding: EdgeInsets.only(top: 100.0), // Adjust top padding here
        child: ListView(
          padding: EdgeInsets.zero, // Remove default ListView padding
          children: [
            ClassroomCard(
              image: Image.asset(
                'assets/images/sign_language.png',
                width: 50.0, // Set your desired width here
                height: 100.0, // Set your desired height here
              ),
              title: 'Sign Language',
              subtitle: 'Learn Sign Language',
              color: Colors.blue,
            ),
            SizedBox(height: 75),
            ClassroomCard(
              image: Image.asset(
                'assets/images/alphabet.png',
                width: 50.0, // Set your desired width here
                height: 100.0, // Set your desired height here
              ),
              title: 'Alphabet',
              subtitle: 'Learn Sign Language Alphabet',
              color: Colors.red,
            ),
            SizedBox(height: 75),
            ClassroomCard(
              image: Image.asset(
                'assets/images/common_words.png',
                width: 50.0, // Set your desired width here
                height: 100.0, // Set your desired height here
              ),
              title: 'Common Words',
              subtitle: 'Learn Sign Language Common Words',
              color: Colors.green,
            ),
            SizedBox(height: 75),
            ClassroomCard(
              image: Image.asset(
                'assets/images/numbers.png',
                width: 50.0, // Set your desired width here
                height: 100.0, // Set your desired height here
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
    return Card(
      child: ListTile(
        leading: image != null
            ? SizedBox(
                width: 50,
                height: 150,
                child: image,

              )
            : Icon(icon, color: color),
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(title, textAlign: TextAlign.right),
        ),
        subtitle: Align(
          alignment: Alignment.centerRight,
          child: Text(subtitle, textAlign: TextAlign.right),
        ),
      ),
    );
  }

}
