import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String userName;
  final String profileImagePath;

  ChatScreen({required this.userName, required this.profileImagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(profileImagePath),
            ),
            SizedBox(width: 8.0),
            Text(
              userName,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.call, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          // Chat messages
          Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    // Example chat message
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'User Name',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Hello!',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Add more chat messages here
                  ],
                ),
              ),
              // Messaging facilities
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.emoji_emotions, color: Colors.black),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.attach_file, color: Colors.black),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.camera_alt, color: Colors.black),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type a message',
                          hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send, color: Colors.black),
                      onPressed: () {
                        // Implement send message functionality here
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
