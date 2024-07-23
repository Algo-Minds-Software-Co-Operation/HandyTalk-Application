import 'package:flutter/material.dart';

class SignLanguage extends StatelessWidget {
  const SignLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Sign Language'),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FilterButton(
                      label: 'All',
                      iconPath: 'assets/images/Select-all.png',
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 1, 190, 248), // Change this color
                    ),
                    FilterButton(
                      label: 'Ongoing',
                      iconPath: 'assets/images/Fire.png',
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 1, 190, 248), // Change this color
                    ),
                    FilterButton(
                      label: 'Incompleted',
                      iconPath: 'assets/images/Assignment-Return.png',
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 1, 190, 248), // Change this color
                    ),
                    FilterButton(
                      label: 'Completed',
                      iconPath: 'assets/images/Check-All.png',
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 1, 190, 248), // Change this color
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    CourseCard(
                      title: 'Find a course you want to learn!',
                      buttonText: 'Check Now',
                      imageUrl: 'assets/images/NeuroTracker.png',
                      isImageRightAligned: true,
                      imageSize: 120.0,
                      buttonPadding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 30.0),
                      buttonForegroundColor: Colors.white, // Button text color
                      buttonBackgroundColor: Color.fromARGB(255, 1, 190, 248), // Button background color
                      cardWidth: 350.0,
                      cardHeight: 145.0,
                      cardShadowColor: Theme.of(context).shadowColor.withOpacity(0.5),
                      cardColor: Color.fromARGB(255, 193, 239, 250),
                      titlePadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                    ),
                    CourseCard(
                      title: 'Creative Art Design Learn',
                      buttonText: 'Get Started',
                      imageUrl: 'assets/images/Cartoon_Vector.png',
                      imageSize: 100.0,
                      buttonPadding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 25.0),
                      buttonForegroundColor: Colors.white, // Button text color
                      buttonBackgroundColor: Color.fromARGB(255, 1, 190, 248), // Button background color
                      cardWidth: 350.0,
                      cardHeight: 145.0,
                      cardShadowColor: Theme.of(context).shadowColor.withOpacity(0.5),
                      cardColor: Color.fromARGB(255, 193, 239, 250),
                      titlePadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                    ),
                    CourseCard(
                      title: 'Another Languages',
                      buttonText: 'Get Started',
                      imageUrl: 'assets/images/Successful_Characters.png',
                      isImageRightAligned: true,
                      imageSize: 100.0,
                      buttonPadding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 25.0),
                      buttonForegroundColor: const Color.fromARGB(255, 255, 255, 255), // Button text color
                      buttonBackgroundColor: Color.fromARGB(255, 1, 190, 248), // Button background color
                      cardWidth: 350.0,
                      cardHeight: 145.0,
                      cardShadowColor: Theme.of(context).shadowColor.withOpacity(0.5),
                      cardColor: Color.fromARGB(255, 193, 239, 250),
                      titlePadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final String iconPath;
  final Color foregroundColor; // Add this parameter
  final Color backgroundColor; // Add this parameter

  const FilterButton({
    required this.label,
    required this.iconPath,
    this.foregroundColor = Colors.black, // Default color
    this.backgroundColor = Colors.white, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      icon: Image.asset(
        iconPath,
        width: 24.0, // Adjust size as needed
        height: 24.0, // Adjust size as needed
      ),
      label: Text(label),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String buttonText;
  final String imageUrl;
  final bool isImageRightAligned;
  final double imageSize;
  final EdgeInsets buttonPadding;
  final Color buttonForegroundColor;
  final Color buttonBackgroundColor;
  final double cardWidth;
  final double cardHeight;
  final Color cardShadowColor;
  final Color cardColor;
  final EdgeInsets titlePadding;

  const CourseCard({
    required this.title,
    required this.buttonText,
    required this.imageUrl,
    this.isImageRightAligned = false,
    this.imageSize = 100.0,
    this.buttonPadding = const EdgeInsets.all(8.0),
    this.buttonForegroundColor = Colors.black,
    this.buttonBackgroundColor = Colors.grey,
    this.cardWidth = double.infinity,
    this.cardHeight = 150.0,
    this.cardShadowColor = Colors.black26,
    this.cardColor = const Color.fromARGB(255, 255, 255, 255), // Semi-transparent white
    this.titlePadding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> cardContent = [
      Image.asset(
        imageUrl,
        width: imageSize,
        height: imageSize,
      ),
      SizedBox(width: 50.0),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: titlePadding,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Padding(
              padding: buttonPadding,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: buttonForegroundColor,
                  backgroundColor: buttonBackgroundColor,
                ),
                child: Text(buttonText),
              ),
            ),
          ],
        ),
      ),
    ];

    if (isImageRightAligned) {
      cardContent = cardContent.reversed.toList();
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          color: cardColor, // Transparent color
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: cardShadowColor,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: cardContent,
        ),
      ),
    );
  }
}
