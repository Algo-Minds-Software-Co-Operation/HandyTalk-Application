import 'package:flutter/material.dart';

class LanguageSelect extends StatelessWidget {
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
          // Add your radio buttons here
          RadioListTile<SingingCharacter>(
            contentPadding: EdgeInsets.only(top: 320.0, left: 100.0),

            title: const Text('English'),
            value: SingingCharacter.english, // Assign a unique value
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
          RadioListTile<SingingCharacter>(
            contentPadding: EdgeInsets.only(top: 400.0, left: 100.0),
            title: const Text('Sinhala'),
            value: SingingCharacter.sinhala, // Assign a unique value
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
          // Add more radio buttons as needed
          // ...
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 550.0),
              child: Image.asset(
                'assets/images/3d-model.png',
                width: 400,
                height: 400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum SingingCharacter { english, sinhala } // Use meaningful enum values

SingingCharacter? _character; // Initialize this variable

void setState(VoidCallback fn) {
  // Implement your state management logic here
}
