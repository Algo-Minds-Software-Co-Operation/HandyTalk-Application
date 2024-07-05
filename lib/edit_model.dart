import 'package:flutter/material.dart';

class EditModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Edit Model'), // Renamed the app bar title
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
                  child: Container(
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
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.face,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.shield_rounded),
                        onPressed: () {
                          // Navigate to shirt editing page
                          // Implement navigation logic here
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.sports),
                        onPressed: () {
                          // Navigate to trouser editing page
                          // Implement navigation logic here
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.auto_awesome_mosaic),
                        onPressed: () {
                          // Navigate to full kit editing page
                          // Implement navigation logic here
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.person),
                        onPressed: () {
                          // Navigate to avatar editing page
                          // Implement navigation logic here
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
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
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // Implement logic for selecting first rectangle
                },
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/face_image_2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Implement logic for selecting second rectangle
                },
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/face_image_1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Additional widgets for face editing as needed
      ],
    );
  }
}
