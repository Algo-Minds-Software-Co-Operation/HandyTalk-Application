import 'package:flutter/material.dart';

class OTPVerify02 extends StatelessWidget {
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
              padding: const EdgeInsets.only(bottom: 570.0),
              child: Text(
                'OTP Verification',
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
              padding: const EdgeInsets.only(bottom: 515.0),
              child: Text(
                'Check your email address',
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
                padding: const EdgeInsets.only(bottom: 455.0),
                child: Image.asset(
                  'assets/images/page-circle-one.png',
                  width: 50,
                  height: 50,
                )),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 350.0),
              child: Text(
                '0 0 0 0',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontSize: 54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 215.0, right: 240.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Resend new otp in ',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '2:00',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 110.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 0, 47, 255).withOpacity(0.75),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(Size(380, 60)),
                ),
                onPressed: () {
                  // Define the onPressed action here
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(0xFFFFFFFF),
                    fontSize: 25.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
                padding: const EdgeInsets.only(top: 550.0),
                child: Image.asset(
                  'assets/images/3d-model.png',
                  width: 400,
                  height: 400,
                )),
          ),
        ],
      ),
    );
  }
}
