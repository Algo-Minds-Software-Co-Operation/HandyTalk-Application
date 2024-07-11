import 'package:HandyTalk/screen/dashboard_pages/edit_model.dart';
import 'package:flutter/material.dart';

class ShieldEditingPage extends StatelessWidget {
  const ShieldEditingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Edit Model'), // Renamed the app bar title
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Implement back button functionality
          },
        ),
        actions: [
          _buildCoinsIcon(), // Added coins section icon
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/background.png',
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 95.0,
                  left: 16.0,
                  right: 16.0,
                  child: SizedBox(
                    width: double.infinity,
                    height: 350.0,
                    child: Image.asset(
                      'assets/images/3d-model.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.face),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditModel()),
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to face editing page
                          // Implement navigation logic here
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: const Icon(
                            Icons.shield_rounded,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.sports),
                        onPressed: () {
                          // Navigate to trouser editing page
                          // Implement navigation logic here
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.auto_awesome_mosaic),
                        onPressed: () {
                          // Navigate to full kit editing page
                          // Implement navigation logic here
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.person),
                        onPressed: () {
                          // Navigate to avatar editing page
                          // Implement navigation logic here
                        },
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: FaceEditingPage(),
                      // Replace with ShirtEditingPage, TrouserEditingPage, etc.
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

  Widget _buildCoinsIcon() {
    return GestureDetector(
      onTap: () {
        // Implement action for coins section if needed
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, color: Colors.white, size: 12),
            SizedBox(width: 2),
            Text(
              '100',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            Icon(Icons.monetization_on, color: Colors.yellow, size: 16),
          ],
        ),
      ),
    );
  }
}

class FaceEditingPage extends StatelessWidget {
  const FaceEditingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildRectangle('assets/images/shirt_01.png', '6 coins'),
              _buildRectangle('assets/images/shirt_02.png', '8 coins'),
              _buildRectangle('assets/images/shirt_03.png', '5 coins'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildRectangle('assets/images/shirt_04.png', '7 coins'),
              _buildRectangle('assets/images/shirt_05.png', '4 coins'),
              _buildRectangle('assets/images/shirt_06.png', '9 coins'),
            ],
          ),
        ),
        // Additional widgets for face editing as needed
      ],
    );
  }

  Widget _buildRectangle(String imagePath, String prizeTag) {
    return GestureDetector(
      onTap: () {
        // Implement logic for selecting rectangle
      },
      child: Stack(
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(76, 0, 0, 0),
                width: 2.0,
              ),
            ),
            padding: const EdgeInsets.all(8.0), // Adjust padding as needed
            child: Center(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 4.0,
            right: 4.0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.monetization_on, color: Colors.yellow, size: 12),
                  const SizedBox(width: 2.0),
                  Text(
                    prizeTag,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
