import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  final String userName;
  final String profileImagePath;

  const CallScreen({super.key, required this.userName, required this.profileImagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(profileImagePath),
                    radius: 60,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    userName,
                    style: const TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Calling...',
                    style: TextStyle(color: Colors.white70, fontSize: 18.0),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.mic_off, color: Colors.white),
                  iconSize: 30.0,
                  onPressed: () {},
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.call_end, color: Colors.white),
                ),
                IconButton(
                  icon: const Icon(Icons.volume_up, color: Colors.white),
                  iconSize: 30.0,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
