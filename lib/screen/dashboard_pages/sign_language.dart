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
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FilterButton(
                          label: 'All',
                          iconPath: 'assets/images/Select-all.png',
                        ),
                        SizedBox(width: 8.0),
                        FilterButton(
                          label: 'Ongoing',
                          iconPath: 'assets/images/Fire.png',
                        ),
                        SizedBox(width: 8.0),
                        FilterButton(
                          label: 'Incompleted',
                          iconPath: 'assets/images/Assignment-Return.png',
                        ),
                        SizedBox(width: 8.0),
                        FilterButton(
                          label: 'Completed',
                          iconPath: 'assets/images/Check-All.png',
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      AnimatedCourseCard(
                        title: 'Find a course you want to learn!',
                        buttonText: 'Check Now',
                        imageUrl: 'assets/images/NeuroTracker.png',
                        isImageRightAligned: true,
                        imageSize: 150.0,
                        buttonPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0), // Increased button width
                        buttonForegroundColor: Colors.white,
                        buttonBackgroundColor: Color.fromARGB(255, 1, 190, 248),
                        cardWidth: MediaQuery.of(context).size.width - 32,
                        cardHeight: 180.0,
                        cardShadowColor: Colors.black26,
                        cardColor: Color.fromARGB(255, 193, 239, 250),
                        titlePadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                      ),
                      SizedBox(height: 16.0),
                      AnimatedCourseCard(
                        title: 'Creative Art Design Learn',
                        buttonText: 'Get Started',
                        imageUrl: 'assets/images/Cartoon_Vector.png',
                        imageSize: 120.0,
                        buttonPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0), // Increased button width
                        buttonForegroundColor: Colors.white,
                        buttonBackgroundColor: Color.fromARGB(255, 1, 190, 248),
                        cardWidth: MediaQuery.of(context).size.width - 32,
                        cardHeight: 180.0,
                        cardShadowColor: Colors.black26,
                        cardColor: Color.fromARGB(255, 193, 239, 250),
                        titlePadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                      ),
                      SizedBox(height: 16.0),
                      AnimatedCourseCard(
                        title: 'Another Languages',
                        buttonText: 'Get Started',
                        imageUrl: 'assets/images/Successful_Characters.png',
                        isImageRightAligned: true,
                        imageSize: 120.0,
                        buttonPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0), // Increased button width
                        buttonForegroundColor: Colors.white,
                        buttonBackgroundColor: Color.fromARGB(255, 1, 190, 248),
                        cardWidth: MediaQuery.of(context).size.width - 32,
                        cardHeight: 180.0,
                        cardShadowColor: Colors.black26,
                        cardColor: Color.fromARGB(255, 193, 239, 250),
                        titlePadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final String iconPath;
  final Color foregroundColor;
  final Color backgroundColor;

  const FilterButton({
    required this.label,
    required this.iconPath,
    this.foregroundColor = Colors.white,
    this.backgroundColor = const Color.fromARGB(255, 1, 190, 248),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
      icon: Image.asset(
        iconPath,
        width: 24.0,
        height: 24.0,
      ),
      label: Text(label),
    );
  }
}

class AnimatedCourseCard extends StatelessWidget {
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

  const AnimatedCourseCard({
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
    this.cardColor = const Color.fromARGB(255, 255, 255, 255),
    this.titlePadding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> cardContent = [
      Image.asset(
        imageUrl,
        width: imageSize,
        height: imageSize,
        fit: BoxFit.cover,
      ),
      SizedBox(width: 16.0),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: titlePadding,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: buttonPadding,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: buttonForegroundColor,
                  backgroundColor: buttonBackgroundColor,
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0), // Adjusted button width
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
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(15.0),
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
