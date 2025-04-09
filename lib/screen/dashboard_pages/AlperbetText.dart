import 'package:flutter/material.dart';

class AlphabetText extends StatelessWidget {
  final String letter; // Add a field to store the letter

  // Update the constructor to accept the letter
  const AlphabetText({super.key, required this.letter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Alphabet'),
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
                            color: const Color.fromARGB(255, 175, 243, 255)
                                .withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 191, 220, 248)
                              .withOpacity(0.35),
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 180, 179, 179)
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
                            letter, // Use the passed letter
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
                    const EdgeInsets.only(bottom: 0.0), // Adjusted padding
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
