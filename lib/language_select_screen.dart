import 'package:flutter/material.dart';

class LanguageSelect extends StatefulWidget {
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
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 520.0),
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
                SizedBox(
                  height: 0,
                  width: 0,
                ), // Adjusted position here
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _character = SingingCharacter.english;
                    });
                    // Navigate to next page
                    navigateToNextPage();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20, horizontal: 50), // Adjusted width here
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _character == SingingCharacter.english
                              ? Color(0xFF0077B6)
                              : Color(0xFF0077B6).withOpacity(0.1),
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: _character == SingingCharacter.english
                            ? Color(0xFF0077B6).withOpacity(0.2)
                            : Color(0xFF0077B6).withOpacity(0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
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
                              // Navigate to next page
                              navigateToNextPage();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _character = SingingCharacter.sinhala;
                    });
                    // Navigate to next page
                    navigateToNextPage();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20, horizontal: 50), // Adjusted width here
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _character == SingingCharacter.sinhala
                              ? Color(0xFF0077B6)
                              : Color(0xFF0077B6).withOpacity(0.1),
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: _character == SingingCharacter.sinhala
                            ? Color(0xFF0077B6).withOpacity(0.2)
                            : Color(0xFF0077B6).withOpacity(0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
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
                              // Navigate to next page
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
          // Center(
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 450.0),
          //     child: Image.asset(
          //       'assets/images/3d-model.png',
          //       width: 400,
          //       height: 400,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  void navigateToNextPage() {
    // Add your navigation logic here, for example:
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => NextPage()),
    // );
  }
}

enum SingingCharacter { english, sinhala }
