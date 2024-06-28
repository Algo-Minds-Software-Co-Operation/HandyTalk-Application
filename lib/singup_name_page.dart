import 'package:flutter/material.dart';

class SignupNamePage extends StatefulWidget {
  const SignupNamePage({Key? key}) : super(key: key);

  @override
  _SignupNamePageState createState() => _SignupNamePageState();
}

class _SignupNamePageState extends State<SignupNamePage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    super.dispose();
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
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 680.0),
              child: Text(
                'Sign in',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 599.0),
              child: Text(
                'Signup for partner of HandyTalk',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 500.0),
              child: Image.asset(
                'assets/images/page-circle-one.png',
                width: 50,
                height: 50,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 585.0),
              child: Image.asset(
                'assets/images/3d-model.png',
                width: 400,
                height: 400,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 360.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double width = constraints.maxWidth * 0.9;
                  if (width > 800) {
                    width = 800; // Increased maximum width limit
                  }
                  return SizedBox(
                    width: width,
                    height: 80,
                    child: TextField(
                      controller: _firstNameController,
                      focusNode: _firstNameFocus,
                      decoration: InputDecoration(
                        labelText: 'First name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 163, 163, 163),
                              width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(Icons.person),
                      ),
                      style: TextStyle(
                        color: const Color.fromARGB(255, 2, 2, 2),
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 220.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double width = constraints.maxWidth * 0.9;
                  if (width > 800) {
                    width = 800; // Increased maximum width limit
                  }
                  return SizedBox(
                    width: width,
                    height: 80,
                    child: TextField(
                      controller: _lastNameController,
                      focusNode: _lastNameFocus,
                      decoration: InputDecoration(
                        labelText: 'Last name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 163, 163, 163),
                              width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(Icons.person),
                      ),
                      style: TextStyle(
                        color: const Color.fromARGB(255, 2, 2, 2),
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double width = constraints.maxWidth * 0.9;
                  if (width > 800) {
                    width = 800; // Increased maximum width limit
                  }
                  return ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, 50), // Responsive width
                      backgroundColor: Color(0xFF0077B6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: TextStyle(color: Colors.black),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
