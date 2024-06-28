import 'package:flutter/material.dart';

class SingupOtpsendPage extends StatelessWidget {
  const SingupOtpsendPage({super.key});

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
                'assets/images/page-circle-two.png',
                width: 50,
                height: 50,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 585.0),
              child: Image.asset(
                'assets/images/3d-model.png',
                width: 400,
                height: 400,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 210.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double width = constraints.maxWidth * 0.9;
                  if (width > 800) {
                    width = 800; // Increased maximum width limit
                  }
                  return SizedBox(
                    width: width,
                    height: 120,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Enter your email address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 163, 163, 163),
                              width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),
                      style: TextStyle(
                        color: const Color.fromARGB(255, 2, 2, 2),
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 60.0, // Adjust top padding as needed
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double width = constraints.maxWidth * 0.9;
                  if (width > 800) {
                    width = 800; // Increased maximum width limit
                  }
                  return ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, 50), // Responsive width
                      backgroundColor:
                          Color(0xFF0077B6), // Background color set to blue
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: TextStyle(
                          color: Colors.white), // Text color set to white
                    ),
                    child: Text(
                      'Send OTP',
                      style: TextStyle(
                          color: Colors.white), // Text color set to white
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
