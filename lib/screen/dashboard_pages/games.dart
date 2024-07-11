import 'package:flutter/material.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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
        padding: const EdgeInsets.only(top: 75.0), // Adjust top padding here
        child: ListView(
          padding: EdgeInsets.zero, // Remove default ListView padding
          children: [
            ClassroomCard(
              image: Image.asset(
                'assets/images/game1.png',
                width: 50.0, // Set your desired width here
                height: 50.0, // Set your desired height here
              ),
              title: 'MathsMan',
              subtitle: 'Learn Math',
              color: Colors.blue,
              isBoldTitle: true,
            ),
            const SizedBox(height: 20),
            ClassroomCard(
              image: Image.asset(
                'assets/images/game2.png',
                width: 50.0, // Set your desired width here
                height: 50.0, // Set your desired height here
              ),
              title: 'Drawio',
              subtitle: 'Drawing Game',
              color: Colors.red,
              isBoldTitle: true,
            ),
            const SizedBox(height: 20),
            ClassroomCard(
              image: Image.asset(
                'assets/images/game3.png',
                width: 50.0, // Set your desired width here
                height: 50.0, // Set your desired height here
              ),
              title: 'HelloSign',
              subtitle: 'Greetings Game',
              color: Colors.green,
              isBoldTitle: true,
            ),
            const SizedBox(height: 20),
            ClassroomCard(
              image: Image.asset(
                'assets/images/game4.png',
                width: 50.0, // Set your desired width here
                height: 50.0, // Set your desired height here
              ),
              title: 'SignPuzzle',
              subtitle: 'Sign Language Puzzle',
              color: Colors.orange,
              isBoldTitle: true,
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
  final bool isBoldTitle;

  const ClassroomCard({super.key, 
    this.icon,
    this.image,
    required this.title,
    required this.subtitle,
    required this.color,
    this.isBoldTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      width: MediaQuery.of(context).size.width - 40, // Decrease width by 40
      height: 130.0, // Adjusted height
      decoration: BoxDecoration(
        color: const Color(0xFFCAF0F8)
            .withOpacity(0.35), // Set background color with opacity
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          if (image != null)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: image,
            )
          else
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(icon, color: color),
            ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight:
                        isBoldTitle ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
