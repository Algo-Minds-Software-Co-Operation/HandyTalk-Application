import 'package:flutter/material.dart';
import 'chat_screen.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          '',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
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
          // Main content
          Padding(
            padding: const EdgeInsets.only(
                top: 100.0), // Adjust top padding as needed
            child: Column(
              children: [
                // Search bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.black),
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        fillColor: Colors.transparent,
                        filled: true,
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                // Groups section
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Find Groups',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                // Groups joined section
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      // Example group
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                  'assets/images/profile-picture-icon.png'), // Replace with group dp path
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'WDM',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Add more groups here
                    ],
                  ),
                ),
                const SizedBox(height: 0.0),
                // Recent chats section
                Transform.translate(
                  offset: const Offset(
                      0, -285), // Adjust the offset to move the section up
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 0, left: 16.0, right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Recent Chats',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        // Example chat
                        ListTile(
                          leading: const CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/images/profile-picture-icon.png'), // Replace with profile pic path
                          ),
                          title: const Text(
                            'User Name',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: const Text(
                            'Last message content...',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          trailing: const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '12:30 PM',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Icon(Icons.check,
                                  color: Colors.black, size: 16.0),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ChatScreen(
                                      userName: 'User Name',
                                      profileImagePath:
                                          'assets/images/profile-picture-icon.png')),
                            );
                          },
                        ),
                        // Add more chats here
                      ],
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
