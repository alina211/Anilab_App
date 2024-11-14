import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'UpdateProfile.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  Map<String, dynamic>? userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Refresh user data when the ProfileScreen is revisited
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    setState(() {
      isLoading = true;
    });

    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        String email = user.email!;
        QuerySnapshot snapshot = await _firestore
            .collection('users')
            .where('email', isEqualTo: email)
            .limit(1)
            .get();

        if (snapshot.docs.isNotEmpty) {
          setState(() {
            userData = snapshot.docs.first.data() as Map<String, dynamic>;
            isLoading = false;
          });
        } else {
          print("No user data found for this email.");
          setState(() {
            isLoading = false;
          });
        }
      }
    } catch (e) {
      print("Error fetching user data: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A1D24), Color(0xFF2C3338)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : userData != null
            ? Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'User Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  SizedBox(height: 20),
                  _buildProfileField("Username",
                      userData!['username'] ?? 'N/A', Icons.account_circle),
                  _buildProfileField("Email", userData!['email'] ?? 'N/A', Icons.email),
                  _buildProfileField("Phone Number", userData!['phone'] ?? 'N/A', Icons.phone),
                  _buildProfileField("Favorite Genre", userData!['favoriteGenre'] ?? 'N/A', Icons.bookmark),
                  _buildProfileField("Gender", userData!['gender'] ?? 'N/A', Icons.accessibility),
                  _buildProfileField("Country", userData!['country'] ?? 'N/A', Icons.location_on),
                  _buildProfileField("Date of Birth", userData!['dateOfBirth'] ?? 'N/A', Icons.cake),
                  _buildProfileField(
                      "Registered At",
                      userData!['registeredAt'] != null
                          ? "${userData!['registeredAt']['date']} at ${userData!['registeredAt']['time']}"
                          : 'N/A',
                      Icons.calendar_today),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserUpdateScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Update Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
            : Center(
            child: Text(
              "No data available",
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }

  Widget _buildProfileField(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFF2A2D34),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      value,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
