import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:HandyTalk/screen/dashboard_pages/edit_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _gifPath = 'assets/gif/password.gif';

  void _searchGif(String searchTerm) async {
    String gifPath = 'assets/gif/$searchTerm.gif';

    // Check if the file exists
    bool fileExists = await _fileExists(gifPath);

    if (fileExists) {
      setState(() {
        _gifPath = gifPath;
      });
    } else {
      _showErrorMessage();
    }
  }

  Future<bool> _fileExists(String path) async {
    try {
      return await File(path).exists();
    } catch (e) {
      return false;
    }
  }

  void _showErrorMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Gif not found!'),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          const Positioned(
            top: 120,
            left: 16,
            right: 16,
            child: SearchBar(),
          ),
          const Positioned(
            top: 200, // Adjust the position as needed
            left: 16,
            right: 16,
            child: ProgressRectangle(),
          ),
          Positioned(
            bottom: 16, // Adjust the bottom margin as needed
            right: 16,
            child: Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Center(
                child: Text(
                  '1.0',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 84, // Adjust the bottom margin as needed
            right: 16,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EditModel()),
                  );
                },
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 125, 236, 255).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.edit,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0, // Adjust the bottom margin as needed
            right: 16,
            child: Image.asset(
              _gifPath,
              width: 350.0, // Adjust width as needed
              height: 350.0, // Adjust height as needed
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  final double width;
  final double height;

  const SearchBar({super.key, this.width = 300.0, this.height = 50.0});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> with SingleTickerProviderStateMixin {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _controller = TextEditingController();
  bool _animate = false;
  late AnimationController _animationController;
  late Animation<double> _animation;
  Timer? _timer;
  int _seconds = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween(begin: 1.0, end: 1.2).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  void _startRecording() {
    setState(() {
      _animate = true;
      _seconds = 0;
    });
    _animationController.repeat(reverse: true);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _stopRecording() {
    setState(() {
      _animate = false;
    });
    _animationController.stop();
    _timer?.cancel();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  String _formatDuration(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }

  void _openCamera() async {
    setState(() {
      _animate = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _animate = false;
    });

    // Handle the photo if needed
    if (photo != null) {
      print('Photo captured: ${photo.path}');
    }
  }

  void _searchGif() {
    final searchTerm = _controller.text.trim();
    if (searchTerm.isNotEmpty) {
      (context as Element).findAncestorStateOfType<_HomeState>()?._searchGif(searchTerm);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: const Color(0x1ACAF0F8), // #CAF0F8 with 10% opacity
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // #000000 with 20% opacity
            offset: const Offset(1, 1),
            blurRadius: 50,
            spreadRadius: 2,
          ),
        ],
        border: Border.all(
          color: Colors.black.withOpacity(0.025), // Black color with 5% opacity
          width: 1.0, // Width of the border
        ),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search_rounded,
            color: Colors.black.withOpacity(0.5), // 50% opacity
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Type text here',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
              ),
              onSubmitted: (_) => _searchGif(),
            ),
          ),
          GestureDetector(
            onTap: _searchGif,
            child: Icon(
              Icons.search,
              color: Colors.black.withOpacity(0.7), // 70% opacity
            ),
          ),
          const SizedBox(width: 10.0), // Space between camera and mic icon
          GestureDetector(
            onTapDown: (_) => _startRecording(),
            onTapUp: (_) => _stopRecording(),
            child: ScaleTransition(
              scale: _animation,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF0077B6), // Circle color #0077B6
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(
                    8.0), // Adjust padding to control the size of the circle
                child: _animate
                    ? Text(
                        _formatDuration(_seconds),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : const Icon(
                        Icons.mic,
                        color: Colors.white, // Mic icon color
                        size: 16.0, // Mic icon size
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressRectangle extends StatelessWidget {
  const ProgressRectangle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0), // Adjust padding as needed
      decoration: BoxDecoration(
        color: const Color(0xFFCAF0F8).withOpacity(0.50), // Set the opacity here
        borderRadius:
            BorderRadius.circular(8.0), // Adjust border radius as needed
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Your progress',
                  style: TextStyle(
                    fontSize: 14.0, // Adjust font size as needed
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '5',
                      style: TextStyle(
                        fontSize: 24.0, // Adjust font size as needed
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      'Days',
                      style: TextStyle(
                        fontSize: 14.0, // Adjust font size as needed
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                ProgressCategory(
                  color: Colors.orange,
                  text: 'Games',
                  width: 20.0, // Adjust width as needed
                  height: 10.0, // Adjust height as needed
                  textSize: 8.0, // Adjust font size as needed
                ),
              ],
            ),
          ),
          // Placeholder for the chart on the right side
          Container(
            width: 60, // Adjust the width as needed
            height: 60, // Adjust the height as needed
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blue.withOpacity(0.2),
            ),
            child: Center(
              child: Text(
                'Chart',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressCategory extends StatelessWidget {
  final Color color;
  final String text;
  final double width;
  final double height;
  final double textSize;

  const ProgressCategory({super.key, 
    required this.color,
    required this.text,
    this.width = 50.0,
    this.height = 30.0,
    this.textSize = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(6.0), // Adjust border radius as needed
          ),
        ),
        const SizedBox(width: 8.0),
        Text(
          text,
          style: TextStyle(
            fontSize: textSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
