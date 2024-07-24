import 'package:flutter/material.dart';
import 'dart:async';
import 'language_select_screen.dart';

class OTPVerifyScreen extends StatefulWidget {
  const OTPVerifyScreen({super.key});

  @override
  _OTPVerify01State createState() => _OTPVerify01State();
}

class _OTPVerify01State extends State<OTPVerifyScreen> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  Color _buttonColor = const Color.fromARGB(255, 148, 148, 148).withOpacity(0.75);
  Timer? _timer;
  int _start = 120; // 2 minutes in seconds
  String _timerText = "2:00";

  @override
  void initState() {
    super.initState();
    startTimer();
    for (var i = 0; i < 4; i++) {
      _otpControllers[i].addListener(_onOtpChanged);
      _otpControllers[i].text = '0'; // Placeholder for OTP fields
    }
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _timerText = "Resend";
        });
        timer.cancel();
      } else {
        setState(() {
          _start--;
          int minutes = _start ~/ 60;
          int seconds = _start % 60;
          _timerText = "$minutes:${seconds.toString().padLeft(2, '0')}";
        });
      }
    });
  }

  void _onOtpChanged() {
    String otp = _otpControllers.map((controller) => controller.text).join();
    if (otp.length == 4) {
      setState(() {
        _buttonColor = Colors.blue;
      });
    } else {
      setState(() {
        _buttonColor = const Color.fromARGB(255, 148, 148, 148).withOpacity(0.75);
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _nextField(int index) {
    if (index < 3) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else {
      FocusScope.of(context).unfocus();
    }
  }

  void _previousField(int index) {
    if (index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    } else {
      FocusScope.of(context).unfocus();
    }
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
              padding: EdgeInsets.only(bottom: 570.0),
              child: Text(
                'OTP Verification',
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
              padding: const EdgeInsets.only(bottom: 515.0),
              child: Text(
                'Check your email address',
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
                padding: const EdgeInsets.only(bottom: 455.0),
                child: Image.asset(
                  'assets/images/page-circle-one.png',
                  width: 50,
                  height: 50,
                )),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 325.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: 60,
                      child: TextField(
                        controller: _otpControllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.black,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: '0', // Placeholder text
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 36,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: Colors.transparent),
                          ),
                        ),
                        onTap: () {
                          if (_otpControllers[index].text == '0') {
                            _otpControllers[index].clear();
                          }
                        },
                        onChanged: (value) {
                          setState(() {});
                          if (value.length == 1) {
                            _nextField(index);
                          } else if (value.isEmpty) {
                            _previousField(index);
                          }
                        },
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 192.0, right: 160.0),
              child: GestureDetector(
                onTap: () {
                  if (_timerText == "Resend") {
                    // Handle resend OTP action here
                  }
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Resend new otp in ',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: _timerText,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color:
                              _timerText == "Resend" ? Colors.blue : Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 110.0),
              child: SizedBox(
                width: 300,
                height: 45,
                child: ElevatedButton(
                  onPressed: _buttonColor == Colors.blue
                      ? () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) =>
                                  const LanguageSelect(),
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
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _buttonColor, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Button radius
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
            ),
          ),
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
