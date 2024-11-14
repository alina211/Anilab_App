import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserUpdateScreen extends StatefulWidget {
  @override
  _UserUpdateScreenState createState() => _UserUpdateScreenState();
}

class _UserUpdateScreenState extends State<UserUpdateScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  final _usernameController = TextEditingController();
  final _genderController = TextEditingController();
  final _contactController = TextEditingController();
  final _dateOfBirthController = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      try {
        DocumentSnapshot snapshot =
        await _firestore.collection('users').doc(user.uid).get();

        if (snapshot.exists) {
          var userData = snapshot.data() as Map<String, dynamic>;
          _usernameController.text = userData['username'] ?? '';
          _genderController.text = userData['gender'] ?? '';
          _contactController.text = userData['phone'] ?? '';
          _dateOfBirthController.text = userData['dateOfBirth'] ?? '';
        }
      } catch (e) {
        print("Error fetching user data: $e");
      }
    }
  }

  Future<void> updateUserData() async {
    setState(() {
      isLoading = true;
    });

    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).update({
          'username': _usernameController.text,
          'gender': _genderController.text,
          'phone': _contactController.text,
          'dateOfBirth':_dateOfBirthController.text
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Profile updated successfully")),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      print("Error updating user data: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update profile")),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1D24),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A1D24), Color(0xFF2C3338)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Update Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  SizedBox(height: 20),
                  _buildProfileField("Username", _usernameController),
                  _buildProfileField("Gender", _genderController),
                  _buildProfileField("Contact", _contactController),
                  _buildProfileField("Date Of Birth", _dateOfBirthController),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: updateUserData,
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        minimumSize: Size(200, 50),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFF2A2D34),
        elevation: 8, // Add shadow effect for a more elevated look
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                Icons.edit,
                color: Colors.white,
                size: 24,
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: label,
                    labelStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Color(0xFF2A2D34),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
