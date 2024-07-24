import 'package:flutter/material.dart';
import 'signin_username_screen.dart';
import 'signup_name_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  void getStartedBtnOnClicked(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            SignupNamePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    );
  }

  void loginBtnOnClicked(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            SignUsernameEnglish(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    );
  }

  void navigateToSinhalaPage(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeSinhalaScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    );
  }

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
            bottom: 720.0,
            left: 20.0, // Adjusted for better placement
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  navigateToSinhalaPage(context);
                },
                child: Image.asset(
                  'assets/images/language-chang-to-sinhala.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 470.0),
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
              padding: const EdgeInsets.only(top: 450.0),
              child: Image.asset(
                'assets/gif/password.gif',
                width: 550,
                height: 500,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 150.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () => getStartedBtnOnClicked(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0077B6).withOpacity(0.75),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(200, 50),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontSize: 14.0,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => loginBtnOnClicked(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.75),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(200, 50),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Roboto-Bold',
                        color: Color(0xFF0077B6),
                        fontSize: 14.0,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeSinhalaScreen extends StatelessWidget {
  const HomeSinhalaScreen({super.key});
  
  void getStartedBtnOnClicked(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            SignupNamePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    );
  }

  void loginBtnOnClicked(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            SignUsernameEnglish(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    );
  }

  void navigateToEnglishPage(BuildContext context) {
    Navigator.pop(context);
  }

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
            bottom: 740.0,
            left: 20.0,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  navigateToEnglishPage(context);
                },
                child: Image.asset(
                  'assets/images/language-chang-to-english.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 470.0),
              child: Text(
                'අප සමඟ එක්වන්න අදම',
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
                'තව දුරටත් ඉදිරියට යාම සඳහා ඔබේ විස්තර ඇතුළත් කරන්න',
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
                'assets/gif/password.gif',
                width: 550,
                height: 500,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 150.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () => getStartedBtnOnClicked(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0077B6).withOpacity(0.75),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(200, 50),
                    ),
                    child: const Text(
                      'ආරම්භ කරන්න',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontSize: 14.0,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => loginBtnOnClicked(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.75),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(200, 50),
                    ),
                    child: const Text(
                      'ලොග් වන්න',
                      style: TextStyle(
                        fontFamily: 'Roboto-Bold',
                        color: Color(0xFF0077B6),
                        fontSize: 14.0,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
