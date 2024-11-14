import 'package:anilab_app/ContactUs.dart';
import 'package:anilab_app/Genres.dart';
import 'package:anilab_app/HomePage.dart';
import 'package:anilab_app/LatestSeries.dart';
import 'package:anilab_app/Login-Register/RegisterScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Cards.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Genres(),
    LatestSeries(),
    ContactForm(),
    RegisterScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: Color(0xFF1A1D24),
      tabBar: CupertinoTabBar(
        backgroundColor: Color(0xFF1A1D24),
        activeColor: Colors.white,
        iconSize: 20,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home,color: Colors.white,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.film,color: Colors.white),
            label: 'Genres',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.tv,color: Colors.white),
            label: 'Latest',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.conversation_bubble,color: Colors.white),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person,color: Colors.white),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
      tabBuilder: (context, index) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
          ),
          child: _pages[index],
        );
      },
    );
  }
}