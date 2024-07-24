import 'package:flutter/material.dart';
import 'add_group_names.dart'; // Import the AddGroupsNames screen
import 'messages.dart'; // Import the message screen

class AllUsers extends StatefulWidget {
  const AllUsers({super.key});

  @override
  _AllUsersState createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  // List to track selected users with their names and profile images
  List<Map<String, String>> _selectedUsers = [];

  // Dummy data for all users
  final List<Map<String, String>> _allUsers = List.generate(20, (index) {
    return {
      'name': 'User $index',
      'profileImage':
          'assets/images/profile-picture-icon.png', // Example profile image path
    };
  });

  // Handle navigation to AddGroupsNames and update the UI if a new group is added
  Future<void> _navigateAndAddGroup() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddGroupsNames(selectedUsers: _selectedUsers),
      ),
    );

    if (result != null && result is Map<String, dynamic>) {
      // Use the result to update the MessagesPage or your state
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MessagesPage(
            newGroup: result,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const MessagesPage(), // Replace with the appropriate screen
              ),
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          'New Groups',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
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
          Padding(
            padding: const EdgeInsets.only(
                top: 100.0), // Adjust top padding as needed
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Aligns children to the left
              children: [
                // Search bar
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
                    child: const TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.black),
                        hintText: 'Search New Groups',
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        fillColor: Colors.transparent,
                        filled: true,
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                // List of users
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        _allUsers.length, // Use the length of your user list
                    itemBuilder: (context, index) {
                      final user = _allUsers[index];
                      final isSelected = _selectedUsers.contains(user);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              _selectedUsers.remove(user); // Deselect user
                            } else {
                              _selectedUsers.add(user); // Select user
                            }
                          });
                        },
                        child: Container(
                          color: isSelected
                              ? Colors.blue.withOpacity(0.2)
                              : Colors.transparent,
                          child: ListTile(
                            title: Text(user['name'] ?? 'User'),
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(
                                  user['profileImage'] ??
                                      'assets/images/profile-picture-icon.png'),
                            ),
                            trailing: isSelected
                                ? Icon(Icons.check,
                                    color: Colors.blue) // Checkmark icon
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Floating action button
          Positioned(
            bottom: 29.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: _navigateAndAddGroup,
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              child: Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}
