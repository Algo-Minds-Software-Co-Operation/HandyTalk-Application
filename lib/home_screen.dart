import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  void getStartedBtnOnClicked() {}

  void loginBtnOnClicked() {}

  void navigateToSinhalaPage() {}

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
          Positioned(
            bottom: 760.0,
            left: 280,
            right: 0,
            child: Center(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    navigateToSinhalaPage();
                  },
                  child: Image.asset(
                    'assets/images/language-chang-to-sinhala.png',
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 470.0),
              child: Text(
                'Join Us Today',
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
              padding: const EdgeInsets.only(bottom: 415.0),
              child: Text(
                'Enter your details to proceed further',
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
                padding: const EdgeInsets.only(bottom: 355.0),
                child: Image.asset(
                  'assets/images/page-circle-one.png',
                  width: 50,
                  height: 50,
                )),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 200.0),
              child: ElevatedButton(
                onPressed: getStartedBtnOnClicked,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFF0077B6).withOpacity(0.75)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(Size(180, 40)),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: 10.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 110.0),
              child: ElevatedButton(
                onPressed: loginBtnOnClicked,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.white.withOpacity(0.75)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(Size(180, 40)),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Roboto-Bold',
                    color: Color(0xFF0077B6),
                    fontSize: 10.0,
                    fontStyle: FontStyle.normal,
                  ),
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
        ],
      ),
    );
  }
}
