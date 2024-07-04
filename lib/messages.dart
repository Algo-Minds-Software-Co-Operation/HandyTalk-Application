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
  List<String> _allChats = List.generate(50, (index) => 'Chat ${index + 1}');
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Positioned search bar
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 86.0, 8.0, 0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors
                  .transparent, // Transparent background color for search bar
            ),
            style: TextStyle(
              color: Colors.white,
            ), // White text color for the search input
          ),
        ),
        // Text above horizontal list of person images
        Padding(
          padding: const EdgeInsets.fromLTRB(
              16.0, 32.0, 16.0, 0), // Adjusted top padding here
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Find Groups', // Text above the horizontal list
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              Icon(
                Icons.add,
                size: 24.0,
                color: Colors.black, // Use Colors.black for simplicity
              ),
            ],
          ),
        ),
        // Horizontal list of person images
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Container(
            height: 115.0, // Fixed height for the horizontal list
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(10, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage(
                            'assets/images/person_${index + 1}.png', // Replace with your image path pattern
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Person ${index + 1}', // Text below each avatar
                          style: TextStyle(
                            fontSize: 12.0,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ),

        // Expanded ListView for chats
        Expanded(
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
                        color: const Color.fromARGB(
                            255, 0, 0, 0), // Color of the small text
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
