import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:HandyTalk/screen/dashboard_pages/edit_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _gifPath = 'assets/gif/password.gif';
  String _gifNotFoundText = 'Gif not found in our database!';
  String _defaultGifPath = 'assets/gif/3d-model.png'; // Default image path

  void _searchGif(String searchTerm) async {
    String normalizedSearchTerm = searchTerm.toLowerCase();
    String gifPath = 'assets/gif/$normalizedSearchTerm.gif';

    bool fileExists = await _fileExists(gifPath);

    if (fileExists) {
      setState(() {
        _gifPath = gifPath;
      });
    } else {
      setState(() {
        _gifPath = _defaultGifPath; // Set default image if GIF is not found
      });
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
        content: Text(_gifNotFoundText),
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
          Positioned(
            top: 120,
            left: 16,
            right: 16,
            child: SearchBar(
              onSearch: (searchTerm) => _searchGif(searchTerm),
            ),
          ),
          Positioned(
            top: 200,
            left: 16,
            right: 16,
            child: ProgressRectangle(),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.6),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(1, 1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  '1.0',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 84,
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
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 125, 236, 255).withOpacity(0.6),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(1, 1),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.edit,
                      color: Color(0xFFFFFFFF),
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 16,
            child: Image.asset(
              _gifPath,
              width: 350.0,
              height: 350.0,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 350.0,
                  height: 350.0,
                  color: Colors.grey.withOpacity(0.3),
                  child: Center(
                    child: Text(
                      _gifNotFoundText,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
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

class SearchBar extends StatefulWidget {
  final double width;
  final double height;
  final ValueChanged<String> onSearch;

  const SearchBar({super.key, this.width = 300.0, this.height = 50.0, required this.onSearch});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> with SingleTickerProviderStateMixin {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _controller = TextEditingController();
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isTyping = false;
  bool _animate = false;
  late AnimationController _animationController;
  late Animation<double> _animation;
  Timer? _timer;
  int _seconds = 0;
  bool _isListening = false;

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

    _controller.addListener(() {
      setState(() {
        _isTyping = _controller.text.isNotEmpty;
      });
    });
  }

  void _startRecording() async {
    setState(() {
      _animate = true;
      _seconds = 0;
      _isListening = true;
    });
    _animationController.repeat(reverse: true);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });

    bool available = await _speech.initialize();
    if (available) {
      _speech.listen(onResult: (result) {
        setState(() {
          _controller.text = result.recognizedWords;
        });
      });
    }
  }

  void _stopRecording() {
    setState(() {
      _animate = false;
      _isListening = false;
    });
    _animationController.stop();
    _timer?.cancel();
    _speech.stop();
    if (_controller.text.isNotEmpty) {
      _searchGif();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer?.cancel();
    _controller.dispose();
    _speech.stop();
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

    if (photo != null) {
      print('Photo captured: ${photo.path}');
    }
  }

  void _searchGif() {
    final searchTerm = _controller.text.trim();
    if (searchTerm.isNotEmpty) {
      widget.onSearch(searchTerm);
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
        color: const Color(0xFFE0F7FA),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(1, 1),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
          width: 1.0,
        ),
      ),
      child: Row(
        children: <Widget>[
          if (!_isTyping)
            Icon(
              Icons.search_rounded,
              color: Colors.black.withOpacity(0.5),
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
          if (!_isTyping) ...[
            GestureDetector(
              onTap: _openCamera,
              child: ScaleTransition(
                scale: _animation,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            GestureDetector(
              onTapDown: (_) => _startRecording(),
              onTapUp: (_) => _stopRecording(),
              child: ScaleTransition(
                scale: _animation,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF0077B6),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8.0),
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
                          color: Colors.white,
                          size: 20.0,
                        ),
                ),
              ),
            ),
          ] else
            GestureDetector(
              onTap: _searchGif,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF0077B6),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8.0),
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 20.0,
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
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFB3E5FC),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
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
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '5',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      'Days',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                ProgressCategory(
                  color: Colors.orange,
                  text: 'Games',
                  width: 20.0,
                  height: 10.0,
                  textSize: 12.0,
                ),
              ],
            ),
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.blue.withOpacity(0.2),
            ),
            child: Center(
              child: Text(
                'Chart',
                style: TextStyle(
                  color: Colors.blueGrey,
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

  const ProgressCategory({
    super.key,
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
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        const SizedBox(width: 8.0),
        Text(
          text,
          style: TextStyle(
            fontSize: textSize,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }
}
