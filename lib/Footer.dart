import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF232C41), // Background color
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 400),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the Row
          children: [
            Row(
              mainAxisSize: MainAxisSize.min, // Minimize the column size
              children: [
                Image(
                  image: NetworkImage('data:image/png;base64,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'), // Make sure to use the correct asset path,
                  width: 150,
                  height: 150,
                ),
                SizedBox(width: 10), // Space between image and text
                Column( // Use Column to stack text vertically
                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                  children: [
                    Text(
                      "anilab",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
