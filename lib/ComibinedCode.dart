import 'package:anilab_app/AboutUs.dart';
import 'package:anilab_app/Download.dart';
import 'package:anilab_app/Features.dart';
import 'package:anilab_app/HomeScreen.dart';
import 'package:anilab_app/Post.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            SizedBox(height: 35), // Spacer between sections
            AnimeAppScreen(),
            SizedBox(height: 35), // Spacer between sections
            Aboutus(),
            SizedBox(height: 35), // Spacer between sections
            PostScreen(),
            ImageWithTextColumn(),
            SizedBox(height: 35), // Spacer between sections
            DownloadScreen(),
          ],
        ),
      ),
    );
  }
}
