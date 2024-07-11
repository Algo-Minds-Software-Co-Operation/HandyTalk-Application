import 'package:flutter/material.dart';
import 'signup_username_screen.dart';

class LanguageSelect extends StatefulWidget {
  const LanguageSelect({super.key});

  @override
  _LanguageSelectState createState() => _LanguageSelectState();
}

class _LanguageSelectState extends State<LanguageSelect> {
  SingingCharacter? _character;

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
          const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 520.0),
              child: Text(
                'Select App Language',
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
              padding: const EdgeInsets.only(bottom: 405.0),
              child: Text(
                'You can change preferences from\n“Settings > Language”\nin later',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 0,
                  width: 0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _character = SingingCharacter.english;
                    });
                    navigateToNextPage();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _character == SingingCharacter.english
                              ? const Color(0xFF0077B6)
                              : const Color(0xFF0077B6).withOpacity(0.1),
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: _character == SingingCharacter.english
                            ? const Color(0xFF0077B6).withOpacity(0.2)
                            : const Color(0xFF0077B6).withOpacity(0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            'English',
                            style: TextStyle(
                              color: Color(0xFF0077B6),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Radio<SingingCharacter>(
                            value: SingingCharacter.english,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                              navigateToNextPage();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _character = SingingCharacter.sinhala;
                    });
                    navigateToNextPage();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _character == SingingCharacter.sinhala
                              ? const Color(0xFF0077B6)
                              : const Color(0xFF0077B6).withOpacity(0.1),
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: _character == SingingCharacter.sinhala
                            ? const Color(0xFF0077B6).withOpacity(0.2)
                            : const Color(0xFF0077B6).withOpacity(0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            'Sinhala - සිංහල',
                            style: TextStyle(
                              color: Color(0xFF0077B6),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Radio<SingingCharacter>(
                            value: SingingCharacter.sinhala,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                              navigateToNextPage();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void navigateToNextPage() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            SignupUsernameScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = 0.0;
          var end = 1.0;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return FadeTransition(
            opacity: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }
}

enum SingingCharacter { english, sinhala }
