import 'package:anilab_app/Cards.dart';
import 'package:anilab_app/Dashboard/Home.dart';
import 'package:anilab_app/HomePage.dart';
import 'package:anilab_app/Login-Register/LoginScreen.dart';
import 'package:anilab_app/Login-Register/RegisterScreen.dart';
import 'package:anilab_app/UpdateProfile.dart';
import 'package:anilab_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'BottomNavBar.dart';
import 'ContactUs.dart';
import 'Feedback.dart';
import 'Genres.dart';
import 'LatestSeries.dart';
import 'Search.dart';
import 'UserProfile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:BottomNavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// import 'package:anilab_app/AboutUs.dart';
// import 'package:anilab_app/Download.dart';
// import 'package:anilab_app/Features.dart';
// import 'package:anilab_app/HomeScreen.dart';
// import 'package:anilab_app/Post.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MainScreen(),
//     );
//   }
// }
//
// class MainScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Color(0xFF1A1D24),
//
//       ),
//       body: PageView(
//         scrollDirection: Axis.vertical,
//         children: [
//           AnimeAppScreen(),
//           Aboutus(),
//           PostScreen(),
//           ImageWithTextColumn(),
//           DownloadScreen(),
//         ],
//       ),
//     );
//   }
// }
