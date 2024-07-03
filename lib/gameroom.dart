import 'package:flutter/material.dart';

class GameroomPage extends StatelessWidget {
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
                'assets/images/game1.png',
                width: 50.0, // Set your desired width here
                height: 100.0, // Set your desired height here
              ),
              title: 'MathsMan',
              subtitle: ' ',
              color: Colors.blue,
            ),
            SizedBox(height: 75),
            ClassroomCard(
              image: Image.asset(
                'assets/images/game2.png',
                width: 50.0, // Set your desired width here
                height: 100.0, // Set your desired height here
              ),
              title: 'Drawio',
              subtitle: ' ',
              color: Colors.red,
            ),
            SizedBox(height: 75),
            ClassroomCard(
              image: Image.asset(
                'assets/images/game3.png',
                width: 50.0, // Set your desired width here
                height: 100.0, // Set your desired height here
              ),
              title: 'HelloSign',
              subtitle: ' ',
              color: Colors.green,
            ),
            SizedBox(height: 75),
            ClassroomCard(
              image: Image.asset(
                'assets/images/game4.png',
                width: 50.0, // Set your desired width here
                height: 100.0, // Set your desired height here
              ),
              title: 'SignPuzzle',
              subtitle: ' ',
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
                height: 50,
                child: image,
              )
            : Icon(icon, color: color),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
