import 'package:flutter/material.dart';

class CoinsScreen extends StatelessWidget {
  const CoinsScreen({super.key});

  Widget _buildCoinPackage(int coins, double price) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFCAF0F8).withOpacity(0.35),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$coins Coins',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '\$${price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFreeCoinsNotification() {
    return Container(
      margin: const EdgeInsets.only(top: 100, left: 16, right: 16, bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 175, 86, 76).withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text(
          'Free 100 Coins available for 7 days only',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildCoinsIcon(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, color: Colors.white, size: 12),
            SizedBox(width: 2),
            Text(
              '100',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            Icon(Icons.monetization_on, color: Colors.yellow, size: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Buy Coins'),
        actions: [
          _buildCoinsIcon(context),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFreeCoinsNotification(),
              Expanded(
                child: ListView(
                  children: [
                    _buildCoinPackage(5, 0.99),
                    _buildCoinPackage(10, 1.99),
                    _buildCoinPackage(50, 1.99),
                    _buildCoinPackage(100, 2.99),
                    _buildCoinPackage(500, 5.99),
                    _buildCoinPackage(1000, 9.99),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Terms & conditions apply. HandyTalk never shares any sensitive information.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.35),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
