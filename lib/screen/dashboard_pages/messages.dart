import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'all_users.dart'; // Correct import for the new groups screen
import 'dart:io'; // Import for File

class Chat {
  final String userName;
  final String profileImagePath;
  final String lastMessage;
  final String time;
  bool isPinned;

  Chat({
    required this.userName,
    required this.profileImagePath,
    required this.lastMessage,
    required this.time,
    this.isPinned = false,
  });
}

class MessagesPage extends StatefulWidget {
  final Map<String, dynamic>? newGroup; // Add this to handle new groups

  const MessagesPage({super.key, this.newGroup});

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  List<Chat> chats = [
    Chat(
      userName: 'User 1',
      profileImagePath: 'assets/images/profile-picture-icon.png',
      lastMessage: 'Last message content 1...',
      time: '12:30 PM',
    ),
    Chat(
      userName: 'User 2',
      profileImagePath: 'assets/images/profile-picture-icon.png',
      lastMessage: 'Last message content 2...',
      time: '1:00 PM',
    ),
    Chat(
      userName: 'User 3',
      profileImagePath: 'assets/images/profile-picture-icon.png',
      lastMessage: 'Last message content 3...',
      time: '10:00 AM',
    ),
    Chat(
      userName: 'User 4',
      profileImagePath: 'assets/images/profile-picture-icon.png',
      lastMessage: 'Last message content 4...',
      time: '6:00 AM',
    ),
    // Add more chats here
  ];

  void togglePin(Chat chat) {
    setState(() {
      chat.isPinned = !chat.isPinned;
      chats.sort((a, b) {
        if (a.isPinned && !b.isPinned) {
          return -1;
        } else if (!a.isPinned && b.isPinned) {
          return 1;
        } else {
          return 0;
        }
      });
    });
  }

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
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Find Groups',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add, color: Colors.black),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AllUsers(),
                            ),
                          ).then((result) {
                            if (result != null &&
                                result is Map<String, dynamic>) {
                              setState(() {});
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),

                // Display new group information
                widget.newGroup != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Group Name: ${widget.newGroup!['name']}'),
                          if (widget.newGroup!['image'] != null)
                            Image.file(
                              File(widget.newGroup!['image']),
                            ),
                        ],
                      )
                    : const Text('No new group created.'),
                const SizedBox(height: 16.0),

                // Recent chats section
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
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
                      // Chat items
                      ...chats.map((chat) => ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(chat
                                  .profileImagePath), // Replace with profile pic path
                            ),
                            title: Text(
                              chat.userName,
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              chat.lastMessage,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  chat.time,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(
                                  chat.isPinned
                                      ? Icons.push_pin
                                      : Icons.push_pin_outlined,
                                  color: chat.isPinned
                                      ? Colors.blue
                                      : Colors.black,
                                  size: 16.0,
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                    userName: chat.userName,
                                    profileImagePath: chat.profileImagePath,
                                  ),
                                ),
                              );
                            },
                            onLongPress: () => togglePin(chat),
                          )),
                    ],
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
