import 'package:flutter/material.dart';

class GroupChat extends StatefulWidget {
  const GroupChat({super.key});

  @override
  _GroupChatState createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [
    {
      'sender': 'User 1',
      'message': 'Hello everyone!',
      'time': '12:30 PM',
    },
    {
      'sender': 'User 2',
      'message': 'Hi! How are you all?',
      'time': '12:32 PM',
    },
    {
      'sender': 'User 3',
      'message': 'Good afternoon!',
      'time': '12:34 PM',
    },
  ];

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.insert(0, {
          'sender': 'Me',
          'message': _messageController.text,
          'time': 'Now',
        });
        _messageController.clear();
      });
    }
  }

  void _showAttachmentOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          child: Wrap(
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.insert_drive_file, color: Colors.white),
                ),
                title: const Text('Document'),
                onTap: () {
                  Navigator.pop(context);
                  // Add functionality for Document
                },
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.pink,
                  child: Icon(Icons.photo, color: Colors.white),
                ),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  // Add functionality for Gallery
                },
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.audiotrack, color: Colors.white),
                ),
                title: const Text('Audio'),
                onTap: () {
                  Navigator.pop(context);
                  // Add functionality for Audio
                },
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.location_on, color: Colors.white),
                ),
                title: const Text('Location'),
                onTap: () {
                  Navigator.pop(context);
                  // Add functionality for Location
                },
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Icon(Icons.contact_phone, color: Colors.white),
                ),
                title: const Text('Contact'),
                onTap: () {
                  Navigator.pop(context);
                  // Add functionality for Contact
                },
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.poll, color: Colors.white),
                ),
                title: const Text('Poll'),
                onTap: () {
                  Navigator.pop(context);
                  // Add functionality for Poll
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showGroupInfo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Group Info'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Group Description: This is a group to learn ASL.'),
              SizedBox(height: 20),
              Text('Group Members:'),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/who.png'),
                ),
                title: Text('User 1'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/who.png'),
                ),
                title: Text('User 2'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/who.png'),
                ),
                title: Text('User 3'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/who.png'),
                ),
                title: Text('Me'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: GestureDetector(
          onTap: _showGroupInfo,
          child: const Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/who.png'),
              ),
              SizedBox(width: 8.0),
              Text(
                'ASL Learn',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam, color: Colors.black),
            onPressed: () {
              // Add video call functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.call, color: Colors.black),
            onPressed: () {
              // Add voice call functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Add more options functionality
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    bool isSentMessage = _messages[index]['sender'] == 'Me';
                    return Column(
                      crossAxisAlignment: isSentMessage
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: isSentMessage
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 5.0,
                            ),
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: isSentMessage ? Colors.blue : Colors.grey,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _messages[index]['sender']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  _messages[index]['message']!,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10.0, left: 10.0, bottom: 5.0),
                          child: Text(
                            _messages[index]['time']!,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              _buildBottomSection(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.emoji_emotions),
                onPressed: () {
                  // Add emoji picker functionality
                },
              ),
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    hintText: 'Type a message',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.attach_file),
                onPressed: _showAttachmentOptions,
              ),
              IconButton(
                icon: const Icon(Icons.camera_alt),
                onPressed: () {
                  // Add camera functionality
                },
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
