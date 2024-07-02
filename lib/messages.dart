import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend the body behind the AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          // Main content
          MessagesBody(),
        ],
      ),
    );
  }
}

class MessagesBody extends StatefulWidget {
  @override
  _MessagesBodyState createState() => _MessagesBodyState();
}

class _MessagesBodyState extends State<MessagesBody> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _allChats = [
    'Chat 1',
    'Chat 2',
    'Chat 3',
    'Chat 4',
    'Chat 5',
    'Chat 6',
    'Chat 7',
    'Chat 8',
    'Chat 9',
    'Chat 10',
    'Chat 11',
    'Chat 12',
    'Chat 13',
    'Chat 14',
    'Chat 15',
    'Chat 16',
    'Chat 17',
    'Chat 18',
    'Chat 19',
    'Chat 20',
    'Chat 21',
    'Chat 22',
    'Chat 23',
    'Chat 24',
    'Chat 25',
    'Chat 26',
    'Chat 27',
    'Chat 28',
    'Chat 29',
    'Chat 30',
    'Chat 31',
    'Chat 32',
    'Chat 33',
    'Chat 34',
    'Chat 35',
    'Chat 36',
    'Chat 37',
    'Chat 38',
    'Chat 39',
    'Chat 40',
    'Chat 41',
    'Chat 42',
    'Chat 43',
    'Chat 44',
    'Chat 45',
    'Chat 46',
    'Chat 47',
    'Chat 48',
    'Chat 49',
    'Chat 50',
  ];
  List<String> _filteredChats = [];

  @override
  void initState() {
    super.initState();
    _filteredChats = _allChats;
    _searchController.addListener(() {
      setState(() {
        _filteredChats = _allChats
            .where((chat) => chat
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Positioned search bar
        Positioned(
          top: 86.0, // Adjust this value to move the search bar up or down
          left: 8.0,
          right: 8.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white
                    .withOpacity(0.8), // Background color of search bar
              ),
            ),
          ),
        ),
        // Positioned ListView
        Positioned(
          top:
              150.0, // Adjust this value to position the ListView correctly below the search bar
          left: 0,
          right: 0,
          bottom: 0,
          child: ListView.builder(
            itemCount: _filteredChats.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/chat_profile_${index % 10 + 1}.png', // Replace with your image path pattern
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _filteredChats[index],
                      style: TextStyle(
                        backgroundColor: Colors.white
                            .withOpacity(0.5), // Background color of list items
                      ),
                    ),
                    Text(
                      'Today', // This is the text to display next to each chat item
                      style: TextStyle(
                        fontSize: 12.0, // Adjust the font size as needed
                        color: Colors.grey, // Color of the small text
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  'Small text underneath ${_filteredChats[index]}', // Replace with your small text
                  style: TextStyle(
                    fontSize: 12.0, // Adjust the font size as needed
                    color: Colors.grey, // Color of the small text
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

void main() => runApp(MaterialApp(
      home: MessagesPage(),
    ));
