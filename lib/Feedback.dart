import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';
import 'package:lottie/lottie.dart'; // Import the lottie package

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;

  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  double _rating = 3.0;
  DateTime _selectedDate = DateTime.now();

  // Save feedback to Firestore
  Future<void> _submitFeedback() async {
    if (_formKey.currentState!.validate()) {
      // Generate a unique ID using the uuid package
      String feedbackId = Uuid().v4();

      DateTime now = DateTime.now();
      String formattedDate = "${now.year}-${now.month}-${now.day}";
      String formattedTime = "${now.hour}:${now.minute}";

      await _firestore.collection('feedback').doc(feedbackId).set({
        'id': feedbackId,
        'name': _nameController.text,
        'email': _emailController.text,
        'rating': _rating,
        'message': _messageController.text,
        'date': formattedDate,
        'time': formattedTime,
      });

      _emailController.clear();
      _nameController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Feedback submitted successfully!')),
      );

      _formKey.currentState!.reset();
      setState(() {
        _rating = 3.0; // Reset rating to default
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1D24),
      appBar: AppBar(title: Text('Feedback Form'), backgroundColor: Color(0xFF1A1D24)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Add Lottie Animation here
            Lottie.network(
              'https://lottie.host/a520ff84-ab81-4d10-ab56-6e94ac49068a/XVIgsUqiGJ.json', // Replace with your local animation file path
              width: 150,
              height: 150,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 20), // Add some space after the animation

            // The feedback form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: Color(0xFF2A2D34),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
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
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
                  ),
                  SizedBox(height: 16),
                  Text('Rating', style: TextStyle(color: Colors.white)),
                  RatingBar.builder(
                    initialRating: _rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        _rating = rating;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _messageController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Message',
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: Color(0xFF2A2D34),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    maxLines: 4,
                    validator: (value) => value!.isEmpty ? 'Please enter your message' : null,
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _submitFeedback,
                    child: Text(
                      'Submit Feedback',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
