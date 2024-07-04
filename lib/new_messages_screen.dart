import 'package:flutter/material.dart';

class NewMessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend the body behind the AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Select contact',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Search action
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // More action
            },
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
          Positioned(
            top: 65, // 50 pixels from the top
            left: 0,
            right: 0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      // New group action
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.all(16.0),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: Icon(Icons.group_add, color: Colors.black),
                        ),
                        SizedBox(width: 16),
                        Text('New group',
                            style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            // New contact action
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            padding: EdgeInsets.all(16.0),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                child:
                                    Icon(Icons.person_add, color: Colors.black),
                              ),
                              SizedBox(width: 16),
                              Text('New contact',
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.qr_code, color: Colors.black),
                        onPressed: () {
                          // QR code action
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Contacts on WhatsApp',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 200, // Adjust based on the position of your buttons
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView.builder(
              itemCount: 10, // Replace with your contacts count
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/images/contact.png'), // Replace with contact image
                  ),
                  title:
                      Text('Contact Name $index'), // Replace with contact name
                  subtitle:
                      Text('Registered on app'), // Replace with contact status
                  trailing: ElevatedButton(
                    onPressed: () {
                      // Invite action
                    },
                    child: Text('Invite'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
