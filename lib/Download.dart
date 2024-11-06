import 'package:flutter/material.dart';

class DownloadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xFF1A1D24),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // Aligns children at the start
                children: <Widget>[
                  // Add the text widgets here
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0), // Optional padding for spacing
                    child: Text(
                      "Download Anilab",
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10), // Space between texts
                  Text(
                    "Just take care of the Anilab & leave the rest to us.",
                    style: TextStyle(fontSize: 18, color: Colors.white), // Ensure text color is white
                    textAlign: TextAlign.center, // Center align the text
                  ),
                  SizedBox(height: 20), // Space before the cards
                  // Add the download cards
                  _buildDownloadCard(context, 'Download for Android', Icons.phone_android_sharp),
                  SizedBox(height: 20), // Space between cards
                  _buildDownloadCard(context, 'Download for Android TV', Icons.tv),
                  SizedBox(height: 20), // Space between cards
                  _buildDownloadCard(context, 'Download for iOS', Icons.phone_android_sharp), // Changed icon for iOS
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDownloadCard(BuildContext context, String buttonText, IconData icon) {
    return Container(
      width: 390,
      height: 220,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        color: Colors.grey.shade800,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Icon(
                icon,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Button action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                minimumSize: Size(10, 60),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.android, color: Colors.white), // Changed icon to a download icon
                  SizedBox(width: 8),
                  Text(buttonText, style: TextStyle(color: Colors.white, fontSize: 17)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
