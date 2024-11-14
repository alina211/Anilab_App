import 'package:flutter/material.dart';

class SeriesDetailScreen extends StatefulWidget {
  final String imageUrl;
  final String seriesName;

  SeriesDetailScreen({required this.imageUrl, required this.seriesName});

  @override
  _SeriesDetailScreenState createState() => _SeriesDetailScreenState();
}

class _SeriesDetailScreenState extends State<SeriesDetailScreen>
    with SingleTickerProviderStateMixin {
  // To handle slide animation
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.seriesName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Color(0xFF1A1D24),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SlideTransition(
                position: _slideAnimation,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.imageUrl,
                    width: 600,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Series Name
              Text(
                widget.seriesName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF1A1D24),
    );
  }
}
