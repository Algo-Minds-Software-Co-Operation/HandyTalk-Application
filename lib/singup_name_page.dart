import 'package:flutter/material.dart';

class SignupNamePage extends StatelessWidget {
  const SignupNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 680.0), // Adjusted padding to move the text higher
              child: Text(
                'Sign in',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 599.0),
              child: Text(
                'Signup for partner of HandyTalk',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 500.0),
              child: Image.asset(
                'assets/images/page-circle-one.png',
                width: 50,
                height: 50,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 485.0),
              child: Image.asset(
                'assets/images/3d-model.png',
                width: 400,
                height: 400,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 380.0),
              child: Container(
                width: 400,
                height: 50, // Increased height to accommodate more top padding
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 163, 163, 163),
                      width: 2),
                  borderRadius:
                      BorderRadius.circular(10), // Border radius added
                  color: Colors.transparent,
                ),

                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    hintText: 'First name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 250.0),
              child: Container(
                width: 400,
                height: 50, // Increased height to accommodate more top padding
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 163, 163, 163),
                      width: 2),
                  borderRadius:
                      BorderRadius.circular(10), // Border radius added
                  color: Colors.transparent,
                ),

                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    hintText: 'Last name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 60.0, // Adjust top padding as needed
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(400, 60), // Set the width and height
                  backgroundColor: Colors.blue, // Background color set to blue
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle:
                      TextStyle(color: Colors.black), // Text color set to black
                ),
                child: Text('next'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
