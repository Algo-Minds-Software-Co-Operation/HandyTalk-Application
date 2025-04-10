import 'package:flutter/material.dart';
import 'dashboard_pages/dashboard_screen.dart';
import 'reset_password_screen.dart';

class SignUserpasswordEnglish extends StatefulWidget {
  final String username;

  const SignUserpasswordEnglish({super.key, required this.username});

  @override
  _SignUserpasswordEnglishState createState() =>
      _SignUserpasswordEnglishState();
}

class _SignUserpasswordEnglishState extends State<SignUserpasswordEnglish> {
  final TextEditingController _passwordController = TextEditingController();
  bool _isChecked = false;
  bool _isPasswordVisible = false;

  void _showError(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
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
          const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 470.0),
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
                'assets/images/page-circle-signin-password.png',
                width: 50,
                height: 50,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 450.0),
              child: Image.asset(
                'assets/gif/password.gif',
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
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
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
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: _isPasswordVisible ? Colors.blue : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    cursorColor: Colors.blue,
                    onTap: () {
                      _passwordController.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: _passwordController.text.length,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value ?? false;
                            });
                          },
                        ),
                        const Text(
                          'Remember me',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    ResetPasswordScreen(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
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
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_passwordController.text == "Malith@2003") {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const DashboardScreen(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
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
                      } else {
                        _showError(context, 'Incorrect password. Please try again.');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0077B6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Next',
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
}
