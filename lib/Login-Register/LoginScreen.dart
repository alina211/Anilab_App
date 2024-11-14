import 'package:anilab_app/Dashboard/FetchedUsers.dart';
import 'package:anilab_app/Dashboard/Home.dart';
import 'package:anilab_app/Download.dart';
import 'package:anilab_app/Features.dart';
import 'package:anilab_app/HomePage.dart';
import 'package:anilab_app/HomeScreen.dart';
import 'package:anilab_app/Login-Register/ForgetPassword.dart';
import 'package:anilab_app/Login-Register/RegisterScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  bool _obscureText = true; // Variable to toggle password visibility
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Define hardcoded credentials for admin and manager
    final Map<String, Map<String, String>> credentials = {
      'admin': {
        'email': 'admin@gmail.com',
        'password': 'adminPass123',
        'role': 'admin',
        'username': 'Admin User',
      },
      'manager': {
        'email': 'manager@gmail.com',
        'password': 'managerPass123',
        'role': 'manager',
        'username': 'Manager User',
      },
    };

    String? role;
    String? username;

    for (var entry in credentials.entries) {
      if (email == entry.value['email'] && password == entry.value['password']) {
        role = entry.value['role'];
        username = entry.value['username'];
        break;
      }
    }

    if (role != null) {

      await prefs.setString('username', username!);
      await prefs.setString('email', email);
      await prefs.setString('role', role);

      if (role == 'admin') {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
      } else if (role == 'manager') {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ImageWithTextColumn()));
      }
    } else {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
        await prefs.setString('username', userCredential.user?.email ?? 'User');
        await prefs.setString('email', email);
        await prefs.setString('role', 'user');


        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())); // Replace with your user home screen
      } on FirebaseAuthException catch (e) {
        // Show an error if credentials do not match
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid credentials. Please try again.")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1D24),
      appBar: AppBar(title: Text('Login'), backgroundColor: Color(0xFF1A1D24)),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/be/18/39/be18398b-13a6-7493-5098-3cc16910a9e8/AppIcon-0-0-1x_U007ephone-0-1-85-220.jpeg/256x256bb.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 24.0),

              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Color(0xFF2A2D34),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) => email = value,
              ),
              SizedBox(height: 16.0),

              // Input field for password
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  fillColor: Color(0xFF2A2D34),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText; // Toggle visibility
                      });
                    },
                  ),
                ),
                obscureText: _obscureText, // Use the variable to set obscureText
                onChanged: (value) => password = value,
              ),
              SizedBox(height: 24.0),

              // Login button
              ElevatedButton(
                onPressed: loginUser,
                child: Text(
                  'Login',
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
              SizedBox(height: 16.0),

              // Register link
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                },
                child: Text(
                  "Don't have an account? Register",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                },
                child: Text(
                  "Forgot Password?",
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
