import 'package:flutter/material.dart';

class AlphabetScreen extends StatelessWidget {
  const AlphabetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Alphabet',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.black.withOpacity(0.75),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 80.0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio:
                      0.7, // Adjusted aspect ratio for smaller rectangles
                  mainAxisSpacing: 20.0, // Increased spacing between rows
                  crossAxisSpacing: 20.0, // Increased spacing between columns
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0), // Horizontal padding around the grid
                itemCount: 26,
                itemBuilder: (context, index) {
                  String letter =
                      String.fromCharCode('A'.codeUnitAt(0) + index);
                  return GestureDetector(
                    onTap: () {
                      // Navigate to specific letter's details if needed
                      // Example: Navigator.push(...);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFCAF0F8).withOpacity(0.25),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          letter,
                          style:
                              const TextStyle(fontSize: 18.0, color: Colors.black87),
                        ),
                      ),
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
