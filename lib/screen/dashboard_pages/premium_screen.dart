import 'package:flutter/material.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
        iconTheme: const IconThemeData(
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
                const SizedBox(height: 60),
                Center(
                  child: Image.asset(
                    'assets/images/premium-pages.png',
                    height: 200,
                  ),
                ),
                const SizedBox(height: 40),
                _buildLabelRow(Icons.build, "Customize 3D Model"),
                _buildLabelRow(
                    Icons.translate, "Text translate to any language"),
                _buildLabelRow(Icons.chat, "Chat groups team members 10+"),
                _buildLabelRow(Icons.block, "No Ads"),
                _buildLabelRow(Icons.more_horiz, "Up to 10 features"),
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(color: Colors.grey),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Select Plan"),
                          ),
                          Expanded(
                            child: Divider(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildPlanCard("Weekly", "29", const Color(0x1508FF00),
                              const Color(0xFF08FF00)),
                          _buildPlanCard("Monthly", "99", const Color(0x15FF9F00),
                              const Color(0xFFFF9F00),
                              isPopular: true),
                          _buildPlanCard("Yearly", "199", const Color(0x150091FF),
                              const Color(0xFF0091FF)),
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
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontFamily: 'Roboto'),
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
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor),
          color: backgroundColor,
        ),
        child: Column(
          children: [
            if (isPopular)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFE9800),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
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
              style: const TextStyle(fontSize: 18, fontFamily: 'Roboto'),
            ),
            const SizedBox(height: 10),
            const Icon(Icons.attach_money, size: 20),
            Text(
              price,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              onPressed: () {},
              child: const Text(
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
