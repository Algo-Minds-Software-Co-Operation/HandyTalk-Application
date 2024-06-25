import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
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
              padding: const EdgeInsets.only(bottom: 470.0),
              child: Text(
                'Reset Your Password',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 400.0, left: 50, right: 50),
              child: Text(
                'Enter your email address and we will send you instruction to reset your password',
                textAlign: TextAlign.center,
                style: TextStyle(
                 
                  fontFamily: 'Roboto',
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
         
          Center(
            child: Padding(
                padding: const EdgeInsets.only(top: 450.0),
                child: Image.asset(
                  'assets/images/3d-model.png',
                  width: 400,
                  height: 400,
                )),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 120.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Use email address',
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      )),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle the next button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 11, 133, 240),
                      padding:
                          EdgeInsets.symmetric(horizontal: 110, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                   TextButton(
                    onPressed: () {
                      // Handle the back to log in button press
                    },
                    style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 110, vertical: 15),
                    ),
                    child: Text(
                      'Back to Log in',
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}