import 'package:flutter/material.dart';

class SignUsernameEnglish extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();

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
                'Sign in',
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
              ),
            ),
          ),
          Positioned(
            top: 240.0, // Adjust this value to move the text box up or down
            left: 40.0, // Adjust this value to move the text box left or right
            right: 40.0, // Adjust this value to move the text box left or right
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the start (left)
              children: [
                Text(
                  'Username',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8), // Space between the label and the text box
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your username',
                  ),
                ),
                SizedBox(height: 20),
                Center( // Centering the button
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your onPressed code here!
                      print('Username: ${_usernameController.text}');
                    },
                    child: Text('Proceed'),
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
