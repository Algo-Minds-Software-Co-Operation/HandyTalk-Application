import 'package:flutter/material.dart';

class CommonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Common Words',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.black.withOpacity(0.75),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 80.0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
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
                    child: TextField(
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20.0),
                    child: ListView(
                      children: [
                        commonWordCard('What is your name?'),
                        commonWordCard('How old are you?'),
                        commonWordCard('Where are you from?'),
                        commonWordCard('Where are you living?'),
                        commonWordCard('I want to go washroom'),
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

  Widget commonWordCard(String text) {
    return GestureDetector(
      onTap: () {
        // Handle navigation to specific common word details if needed
        // Example: Navigator.push(...);
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color(0xFFCAF0F8).withOpacity(0.25),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18.0, color: Colors.black87),
        ),
      ),
    );
  }
}