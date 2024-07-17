import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class ChatScreen extends StatefulWidget {
  final String userName;
  final String profileImagePath;

  const ChatScreen(
      {super.key, required this.userName, required this.profileImagePath});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  bool _show3DModel = false;
  List<String> _messages = [];
  bool _showEmojiPicker = false;

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.insert(0, _messageController.text);
        _messageController.clear();
      });
    }
  }

  void _sendFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _messages.insert(0, 'File: ${file.name}');
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
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
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

                    return Align(
                      alignment: isSentMessage
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _show3DModel = !_show3DModel;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: isSentMessage
                                ? Colors.blue.withOpacity(0.2)
                                : Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'User Name',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                _messages[index],
                                style: const TextStyle(color: Colors.black),
                              ),
                              if (_show3DModel)
                                Container(
                                  margin: const EdgeInsets.only(top: 8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: Center(
                                    child: Image.asset(
                                      'assets/images/3d-model.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              Text(
                                'Translate to sign language',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.black.withOpacity(0.35),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (_showEmojiPicker)
                SizedBox(
                  height: 250,
                  child: EmojiPicker(
                    onEmojiSelected: (category, emoji) {
                      _sendEmoji(emoji.emoji);
                    },
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon:
                          const Icon(Icons.emoji_emotions, color: Colors.black),
                      onPressed: _toggleEmojiPicker,
                    ),
                    IconButton(
                      icon: const Icon(Icons.attach_file, color: Colors.black),
                      onPressed: _sendFile,
                    ),
                    IconButton(
                      icon: const Icon(Icons.camera_alt, color: Colors.black),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          hintText: 'Type a message',
                          hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send, color: Colors.black),
                      onPressed: _sendMessage,
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
