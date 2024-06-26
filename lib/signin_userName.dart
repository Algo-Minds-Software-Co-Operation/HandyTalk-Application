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
              children: [
                SizedBox(
                  width: double.infinity, // Makes the text box full width within the padding
                  height: 50, // Set a fixed height for the text field
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Text field radius
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Text field radius when focused
                        borderSide: BorderSide(
                          color: Colors.blue, // Border color when focused
                        ),
                      ),
                      labelText: 'Username',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity, // Makes the button full width within the padding
                  height: 50, // Set the same fixed height for the button
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your onPressed code here!
                      print('Username: ${_usernameController.text}');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0077B6), // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Button radius
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white, // Text color
                        //fontWeight: FontWeight.bold, // Text bold
                        fontFamily: 'roboto',
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
}
