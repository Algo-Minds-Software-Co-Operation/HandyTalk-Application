import 'package:flutter/material.dart';

class NumberText extends StatelessWidget {
  final String letter; // Field to store the number

  // Constructor to accept the number
  NumberText({super.key, required this.letter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Number'),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200.0), // Adjusted padding
                child: Center(
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(20), // Border radius
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 175, 243, 255)
                                .withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 191, 220, 248)
                              .withOpacity(0.35),
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 180, 179, 179)
                                  .withOpacity(0.15),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          border: Border.all(
                            color: Colors.white.withOpacity(0.75),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            letter, // Display the passed number
                            style: const TextStyle(
                              fontSize: 38.0,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 150.0), // Adjusted padding
                child: Image.asset(
                  'assets/images/3d-model.png',
                  width: 400,
                  height: 400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
