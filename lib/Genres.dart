import 'dart:async'; // Import for Timer
import 'package:flutter/material.dart';

class Genres extends StatefulWidget {
  @override
  _GenresState createState() => _GenresState();
}

class _GenresState extends State<Genres> {
  final List<String> buttonLabels = [
    "Action", "Adventure", "Cars", "Comedy", "Dementia", "Demons",
    "Drama", "Ecchi", "Fantasy", "Game", "Harem", "Historical",
    "Horror", "Isekai", "Josei", "Kids", "Magic", "Martial Arts",
    "Mecha", "Military", "Music", "Mystery", "Parody",
    "Police", "Psychological", "Romance", "Samurai", "School", "Sci-Fi",
    "Seinen", "Shoujo", "Thriller", "Shounen", "Supernatural",
    "Slice of life", "Space", "Sports", "Super Power", "Vampire"
  ];

  bool _isAdVisible = true;

  @override
  void initState() {
    super.initState();
    _startAdTimer();
  }

  void _startAdTimer() {
    Timer(Duration(seconds: 8), () {
      setState(() {
        _isAdVisible = false; // Hide the ad after 5 seconds
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF1A1D24),
        appBar: AppBar(
          backgroundColor: Color(0xFF1A1D24),
          title: Text(
            'Genres',
            style: TextStyle(color: Colors.white, fontSize: 26),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _isAdVisible
                      ? GestureDetector(
                    onTap: () {
                      print('Ad clicked!');
                    },
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvU7gQDijib6vVeyFp4WtfELcjiAwJl5g73g&s', // Replace with your ad image URL
                      width: double.infinity, // Ad image width
                      height: 400, // Ad image height
                      fit: BoxFit.cover,
                    ),
                  )
                      : SizedBox.shrink(), // Empty space when ad is hidden

                  // Genres buttons list
                  Wrap(
                    spacing: 8, // Horizontal space between buttons
                    runSpacing: 12, // Vertical space between rows of buttons
                    children: List.generate(buttonLabels.length, (index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width / 2.9 - 18, // Adjusted for wider buttons
                        child: Card(
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            color: Colors.grey.shade700,
                            padding: EdgeInsets.all(16),
                            child: Text(
                              buttonLabels[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
