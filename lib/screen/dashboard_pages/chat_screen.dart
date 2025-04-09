import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'call_screen.dart'; // Import the CallScreen

class ChatScreen extends StatefulWidget {
  final String userName;
  final String profileImagePath;

  const ChatScreen(
      {super.key, required this.userName, required this.profileImagePath});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _messageController = TextEditingController();
  bool _show3DModel = false;
  final List<String> _messages = [];
  bool _showEmojiPicker = false;
  bool _showSignLanguageToText = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.insert(0, _messageController.text);
        _messageController.clear();
        _showSignLanguageToText = true;
      });
    }
  }

  void _sendFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _messages.insert(0, 'File: ${file.name}');
        _showSignLanguageToText = true;
      });
    }
  }

  void _sendEmoji(String emoji) {
    _messageController.text += emoji;
  }

  void _toggleEmojiPicker() {
    setState(() {
      _showEmojiPicker = !_showEmojiPicker;
    });
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
                  _sendFile();
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

  void _showMoreOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.person, color: Colors.black),
                title: const Text('View Contact'),
                onTap: () {
                  Navigator.pop(context);
                  // Add functionality for View Contact
                },
              ),
              ListTile(
                leading: const Icon(Icons.link, color: Colors.black),
                title: const Text('Media, links, and docs'),
                onTap: () {
                  Navigator.pop(context);
                  // Add functionality for Media, links, and docs
                },
              ),
              ListTile(
                leading: const Icon(Icons.search, color: Colors.black),
                title: const Text('Search'),
                onTap: () {
                  Navigator.pop(context);
                  // Add functionality for Search
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications_off, color: Colors.black),
                title: const Text('Mute notifications'),
                onTap: () {
                  Navigator.pop(context);
                  // Add functionality for Mute notifications
                },
              ),
              ListTile(
                leading: const Icon(Icons.timer, color: Colors.black),
                title: const Text('Disappearing messages'),
                onTap: () {
                  Navigator.pop(context);
                  // Add functionality for Disappearing messages
                },
              ),
              ListTile(
                leading: const Icon(Icons.wallpaper, color: Colors.black),
                title: const Text('Wallpaper'),
                onTap: () {
                  Navigator.pop(context);
                  // Add functionality for Wallpaper
                },
              ),
              ListTile(
                leading: const Icon(Icons.more_horiz, color: Colors.black),
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('More'),
                    Icon(Icons.arrow_forward, color: Colors.black),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                  // Add functionality for More
                },
              ),
            ],
          ),
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
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.profileImagePath),
            ),
            const SizedBox(width: 8.0),
            Text(
              widget.userName,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.call, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CallScreen(
                    userName: widget.userName,
                    profileImagePath: widget.profileImagePath,
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: _showMoreOptions,
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
                    bool isSentMessage = true;

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
                            child: Text(
                              _messages[index],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        if (_showSignLanguageToText)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _show3DModel = !_show3DModel;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0, bottom: 5.0),
                              child: Text(
                                'Sign language to text',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
              if (_showEmojiPicker) _buildEmojiStickerPicker(),
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
                onPressed: _toggleEmojiPicker,
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
                  setState(() {
                    _show3DModel = !_show3DModel;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ),
        if (_show3DModel) _build3DModelSection(),
      ],
    );
  }

  Widget _buildEmojiStickerPicker() {
    return SizedBox(
      height: 300.0,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Emoji'),
              Tab(text: 'Stickers'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                GridView.count(
                  crossAxisCount: 8,
                  children: List.generate(40, (index) {
                    String emoji = String.fromCharCodes([0x1F600 + index]);
                    return GestureDetector(
                      onTap: () => _sendEmoji(emoji),
                      child: Center(
                        child: Text(
                          emoji,
                          style: const TextStyle(fontSize: 24.0),
                        ),
                      ),
                    );
                  }),
                ),
                GridView.count(
                  crossAxisCount: 4,
                  children: List.generate(16, (index) {
                    return GestureDetector(
                      onTap: () {
                        // Handle sticker selection
                      },
                      child: Center(
                        child: Image.asset(
                          'assets/stickers/sticker_$index.png',
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _build3DModelSection() {
    return SizedBox(
      height: 300.0,
      child: Image.asset('assets/images/3d-model.png'),
    );
  }
}
