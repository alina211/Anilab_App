import 'package:flutter/material.dart';

class AnimeAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1A1D24),
      appBar: AppBar(
        backgroundColor: Color(0xFF232C41),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(
                  'data:image/jpeg;base64,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',
                  height: 50,
                ),
                SizedBox(width: 8),
                Text(
                  'anilab',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Change text color as needed
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {
                // Add your filter action here
              },
              color: Colors.white, // Change icon color as needed
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Opacity(
                  opacity: 0.3,
                  child: Container(
                    width: double.infinity,
                    height: 450,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhtLebUcE6usFxx0m8fuqJzw8PrzCIeDO4Nw&s',
                        ), // Background image path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Centered text and button
                Positioned.fill(
                  top: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Anilab ",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.red, // Red color for "Anilab"
                                height: 1.5, // Adjust the line height for spacing
                                shadows: [
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 3.0,
                                    color: Colors.black26,
                                  ),
                                ],
                              ),
                            ),
                            TextSpan(
                              text: "- Best Anime\n",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // White color for "Best Anime"
                                height: 1.5, // Adjust the line height for spacing
                                shadows: [
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 3.0,
                                    color: Colors.black26,
                                  ),
                                ],
                              ),
                            ),
                            TextSpan(
                              text: "App for Android\n",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // White color for "App for Android"
                                height: 1.5, // Adjust the line height for spacing
                                shadows: [
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 3.0,
                                    color: Colors.black26,
                                  ),
                                ],
                              ),
                            ),
                            TextSpan(
                              text: "iOS",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // White color for "iOS"
                                height: 1.5, // Adjust the line height for spacing
                                shadows: [
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 3.0,
                                    color: Colors.black26,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Tired of endless googling for safe and free anime streaming apps? Your search ends right here! Save time for what matters and let us handle the rest, delivering the best streaming experience to you.",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20), // Space between text and button
                      ElevatedButton.icon(
                        onPressed: () {
                          // Add your download logic here
                        },
                        icon: Icon(Icons.download, color: Colors.white),
                        label: Text(
                          "Download Anilab",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(10, 10),
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          backgroundColor: Colors.red,
                          textStyle: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Space between Stack and text below
            Text(
              "*Scroll down for further versions download",
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20), // Space between text and image
            Image.network(
              'https://phcorner.net/attachments/1701392024580-png.2829498/', // Replace with your image URL
              width: 400,
              height: 300,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
