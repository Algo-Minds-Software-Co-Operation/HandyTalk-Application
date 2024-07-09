import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings>
    with SingleTickerProviderStateMixin {
  File? _image;
  bool _isAnimating = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _isAnimating = false;
          });
        }
      });
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
        _isAnimating = true;
        _animationController.forward(from: 0.0);
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 100, // Positioned 100 pixels from the top
          left: MediaQuery.of(context).size.width / 2 - 160,
          child: Container(
            width: 320,
            height: 250,
            decoration: BoxDecoration(
              color: Color(0xFFCAF0F8).withOpacity(0.25),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF000000).withOpacity(0.35),
                  offset: Offset(0, 0),
                  blurRadius: 150,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Center(
              child: GestureDetector(
                onLongPress: () {
                  setState(() {
                    _isAnimating = true;
                  });
                  _animationController.forward(from: 0.0);
                  Future.delayed(Duration(seconds: 3), _pickImage);
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 30,
                      child: AnimatedContainer(
                        duration: Duration(seconds: 3),
                        curve: Curves.easeInOut,
                        width: _isAnimating ? 80 : 60,
                        height: _isAnimating ? 80 : 60,
                        child: ClipOval(
                          child: _image == null
                              ? Image.asset(
                                  'assets/images/tempory_img.png',
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  _image!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 110,
                      child: Text(
                        'Kavindu Malshan',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Roboto-Bold',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 130,
                      child: Text(
                        '@kavindu1125',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 12,
                          fontFamily: 'Roboto-Bold',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.email,
                              color: Colors.black.withOpacity(0.75), size: 16),
                          SizedBox(width: 8), // Adjust spacing as needed
                          Text(
                            'kavindu11250403@gmail.com',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.75),
                              fontSize: 12,
                              fontFamily: 'Roboto-Bold',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(width: 8), // Adjust spacing as needed
                          SizedBox(
                            width: 75.0, // Set width of the button
                            height: 20.0, // Set height of the button
                            child: ElevatedButton(
                              onPressed: () {
                                // Add functionality for the button
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(Color(
                                        0xFF4BFF2E)), // Set background color to #4BFF2E
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Set border radius
                                  ),
                                ),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(Colors
                                        .white), // Set font color to white
                              ),
                              child: Text(
                                'verified',
                                style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: 'Roboto-Bold',
                                    color: Colors
                                        .white), // Set text color to white
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 370,
          left: MediaQuery.of(context).size.width / 2 - 160,
          child: Container(
            width: 320,
            height: 125,
            decoration: BoxDecoration(
              color: Color(0xFFCAF0F8).withOpacity(0.25),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF000000).withOpacity(0.35),
                  offset: Offset(0, 0),
                  blurRadius: 150,
                  spreadRadius: 5,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 515,
          left: MediaQuery.of(context).size.width / 2 - 160,
          child: Container(
            width: 320,
            height: 125,
            decoration: BoxDecoration(
              color: Color(0xFFCAF0F8).withOpacity(0.25),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF000000).withOpacity(0.35),
                  offset: Offset(0, 0),
                  blurRadius: 150,
                  spreadRadius: 5,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
