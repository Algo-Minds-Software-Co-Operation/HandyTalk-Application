import 'package:flutter/material.dart';
import 'home_screen.dart';

class SignupUserpasswordScreen extends StatefulWidget {
  @override
  _SignupUserpasswordScreenState createState() =>
      _SignupUserpasswordScreenState();
}

class _SignupUserpasswordScreenState extends State<SignupUserpasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool isLengthValid = false;
  bool hasLetterAndNumber = false;

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
                'Sign up',
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
                'Enter a new password',
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
                'assets/images/page-circle-signup-five.png',
                width: 75,
                height: 75,
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
            top: 270.0,
            left: 40.0,
            right: 40.0,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: TextField(
                    controller: _newPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue.withOpacity(0.5),
                        ),
                      ),
                      labelText: 'New Password',
                      labelStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    cursorColor: Colors.blue,
                    onTap: () {
                      _newPasswordController.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: _newPasswordController.text.length,
                      );
                    },
                    onChanged: (value) {
                      validatePassword(value);
                    },
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue.withOpacity(0.5),
                        ),
                      ),
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    cursorColor: Colors.blue,
                    onTap: () {
                      _confirmPasswordController.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: _confirmPasswordController.text.length,
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                // Placeholder for validation messages
                // Implement your validation UI here
                // Example:
                Row(
                  children: [
                    Icon(
                      isLengthValid ? Icons.check_circle : Icons.error,
                      color: isLengthValid ? Colors.green : Colors.red,
                    ),
                    SizedBox(width: 5),
                    Text(
                      isLengthValid
                          ? '8 characters (20 max)'
                          : '8-20 characters required',
                      style: TextStyle(
                        fontSize: 12,
                        color: isLengthValid ? Colors.black : Colors.red,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      hasLetterAndNumber ? Icons.check_circle : Icons.error,
                      color: hasLetterAndNumber ? Colors.green : Colors.red,
                    ),
                    SizedBox(width: 5),
                    Text(
                      hasLetterAndNumber
                          ? 'Contains letter and number'
                          : 'Requires 1 letter and 1 number',
                      style: TextStyle(
                        fontSize: 12,
                        color: hasLetterAndNumber ? Colors.black : Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  HomeScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var begin = 0.0;
                            var end = 1.0;
                            var curve = Curves.ease;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));

                            return FadeTransition(
                              opacity: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0077B6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Finish',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto-Bold',
                        fontSize: 13,
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

  void validatePassword(String value) {
    // Validate password criteria here (1 letter, 1 number, length)
    bool hasLetter = value.contains(RegExp(r'[a-zA-Z]'));
    bool hasNumber = value.contains(RegExp(r'[0-9]'));
    bool lengthValid = value.length >= 8 && value.length <= 20;

    setState(() {
      isLengthValid = lengthValid;
      hasLetterAndNumber = hasLetter && hasNumber;
    });
  }
}
