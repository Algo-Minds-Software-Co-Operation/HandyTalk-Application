import 'package:flutter/material.dart';

class PremiumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          "Upgrade Premium",
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.black.withOpacity(0.75),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.black), // Change the color of the back button
      ),
      extendBodyBehindAppBar:
          true, // Extends the body behind the AppBar to make it truly transparent
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                Center(
                  child: Image.asset(
                    'assets/images/premium-pages.png',
                    height: 200,
                  ),
                ),
                SizedBox(height: 40),
                _buildLabelRow(Icons.build, "Customize 3D Model"),
                _buildLabelRow(
                    Icons.translate, "Text translate to any language"),
                _buildLabelRow(Icons.chat, "Chat groups team members 10+"),
                _buildLabelRow(Icons.block, "No Ads"),
                _buildLabelRow(Icons.more_horiz, "Up to 10 features"),
                SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(color: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Select Plan"),
                          ),
                          Expanded(
                            child: Divider(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildPlanCard("Weekly", "29", Color(0x1508FF00),
                              Color(0xFF08FF00)),
                          _buildPlanCard("Monthly", "99", Color(0x15FF9F00),
                              Color(0xFFFF9F00),
                              isPopular: true),
                          _buildPlanCard("Yearly", "199", Color(0x150091FF),
                              Color(0xFF0091FF)),
                        ],
                      ),
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

  Widget _buildLabelRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontFamily: 'Roboto'),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanCard(
      String duration, String price, Color backgroundColor, Color borderColor,
      {bool isPopular = false}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor),
          color: backgroundColor,
        ),
        child: Column(
          children: [
            if (isPopular)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFFFE9800),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "Popular",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            Text(
              duration,
              style: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
            ),
            SizedBox(height: 10),
            Icon(Icons.attach_money, size: 20),
            Text(
              price,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              onPressed: () {},
              child: Text(
                "Buy",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
