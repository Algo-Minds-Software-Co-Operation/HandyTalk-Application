import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 120,
          left: 16,
          right: 16,
          child: SearchBar(),
        ),
      ],
    );
  }
}

class SearchBar extends StatefulWidget {
  final double width;
  final double height;

  SearchBar({this.width = 300.0, this.height = 50.0});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final ImagePicker _picker = ImagePicker();
  bool _animate = false;

  void _openCamera() async {
    setState(() {
      _animate = true;
    });

    await Future.delayed(Duration(seconds: 2));

    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _animate = false;
    });

    // Handle the photo if needed
    if (photo != null) {
      print('Photo captured: ${photo.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: Color(0x1ACAF0F8), // #CAF0F8 with 10% opacity
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // #000000 with 20% opacity
            offset: Offset(1, 1),
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
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
              ),
            ),
          ),
          GestureDetector(
            onTap: _openCamera,
            child: Icon(
              Icons.camera_alt_rounded,
              color: Colors.black.withOpacity(0.7), // 70% opacity
            ),
          ),
          SizedBox(width: 10.0), // Space between camera and mic icon
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF0077B6), // Circle color #0077B6
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(
                8.0), // Adjust padding to control the size of the circle
            child: Icon(
              Icons.mic,
              color: Colors.white, // Mic icon color
              size: 16.0, // Mic icon size
            ),
          ),
        ],
      ),
    );
  }
}
