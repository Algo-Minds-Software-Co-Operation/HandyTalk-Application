import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddGroupsNames extends StatefulWidget {
  final List<Map<String, String>> selectedUsers;

  const AddGroupsNames({super.key, required this.selectedUsers});

  @override
  _AddGroupsNamesState createState() => _AddGroupsNamesState();
}

class _AddGroupsNamesState extends State<AddGroupsNames> {
  // Controller for the group name text field
  final TextEditingController _groupNameController = TextEditingController();
  // Variable to hold the picked image file
  File? _groupImage;

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _groupImage = File(pickedFile.path);
      });
    }
  }

  // Function to handle the add button press
  void _onAddButtonPressed() {
    final groupName = _groupNameController.text;

    // Check if the group name is empty
    if (groupName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Group name cannot be empty')),
      );
      return;
    }

    // Pop the current screen and pass back the group name and image path
    Navigator.pop(context, {
      'name': groupName,
      'image': _groupImage?.path,
    });
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
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        centerTitle: true,
        title: const Text(
          'Add Groups', // Updated title text for clarity
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
                top: 120.0), // Increased top padding to move content down
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align children to the left
              children: [
                // Group name text field
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
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage: _groupImage != null
                                  ? FileImage(_groupImage!)
                                  : null,
                              child: _groupImage == null
                                  ? const Icon(Icons.add_a_photo,
                                      color: Color.fromARGB(255, 39, 32, 32))
                                  : null,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: _groupNameController,
                            decoration: const InputDecoration(
                              hintText: 'Group Name',
                              hintStyle: TextStyle(color: Colors.black),
                              border: InputBorder.none,
                              fillColor: Colors.transparent,
                              filled: true,
                            ),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                    height:
                        32.0), // Adjusted space between group name and "Members"
                // "Members" text and selected users count
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  child: Row(
                    children: [
                      const Text(
                        'Members',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        '(${widget.selectedUsers.length})',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                    height:
                        24.0), // Increased space between "Members" and user list
                // List of selected users
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0,
                        bottom: 6.0), // Adjusted top padding for the user list
                    child: ListView.builder(
                      itemCount: widget.selectedUsers.length,
                      itemBuilder: (context, index) {
                        final user = widget.selectedUsers[index];
                        return ListTile(
                          title: Text(user['name'] ?? 'User'),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(user['profileImage'] ??
                                'assets/images/profile-picture-icon.png'),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Positioned Add button
          Positioned(
            bottom: 29.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: _onAddButtonPressed,
              child: const Icon(Icons.check), // Change this to the desired icon
              backgroundColor: Colors.blue, // Customize as needed
              foregroundColor: Colors.white, // Customize as needed
            ),
          ),
        ],
      ),
    );
  }
}