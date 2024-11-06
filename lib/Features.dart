import 'package:flutter/material.dart';

class ImageWithTextColumn extends StatelessWidget {
  final List<Map<String, dynamic>> cardData = [
    {
      'title': 'Free without an account',
      'subtitle': [
        'No hidden fees and no risks of identity',
        'leakage, enjoy total access to our extensive',
        'library of thousands of anime titles.'
      ],
      'imageUrl': 'https://cdn-icons-png.flaticon.com/128/9246/9246026.png',
    },
    {
      'title': 'High Quality Streams',
      'subtitle': [
        'Watch anime in HD quality with no buffering.',
        'Smooth and fast streaming experience on any device.',
        'Enjoy popular titles with minimal ads.'
      ],
      'imageUrl': 'https://cdn-icons-png.flaticon.com/128/16744/16744143.png',
    },
    {
      'title': 'Ad-Free Experience',
      'subtitle': [
        'Minimal ads for an uninterrupted experience.',
        'Enjoy your favorite shows without distraction.',
        'Focus solely on the anime content you love.'
      ],
      'imageUrl': 'https://cdn-icons-png.flaticon.com/128/3172/3172981.png',
    },
    {
      'title': 'Wide Variety of Genres',
      'subtitle': [
        'From action to romance, we cover all genres.',
        'Discover new titles and hidden gems easily.',
        'Perfect for any mood or preference.'
      ],
      'imageUrl': 'https://cdn-icons-png.flaticon.com/128/3128/3128307.png',
    },
    {
      'title': 'Constantly Updated Library',
      'subtitle': [
        'New episodes and series are added regularly.',
        'Stay up-to-date with ongoing anime seasons.',
        'Never miss the latest content.'
      ],
      'imageUrl': 'https://cdn-icons-png.flaticon.com/128/396/396104.png',
    },
    {
      'title': 'User-Friendly Interface',
      'subtitle': [
        'Simple navigation for easy browsing.',
        'Find anime titles quickly with search options.',
        'Designed with the viewer in mind.'
      ],
      'imageUrl': 'https://cdn-icons-png.flaticon.com/128/6572/6572766.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final titleFontSize = screenWidth > 600 ? 22.0 : 20.0;
    final subtitleFontSize = screenWidth > 600 ? 16.0 : 14.0;
    final imageWidth = screenWidth > 600 ? 120.0 : 100.0;
    final imageHeight = screenWidth > 600 ? 170.0 : 100.0;
    final spacing = screenWidth > 600 ? 20.0 : 10.0;

    return Scaffold(
      backgroundColor: Color(0xFF1A1D24),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: cardData.length,
            itemBuilder: (context, index) {
              final data = cardData[index];
              return Card(
                color: Colors.grey[850],
                margin: EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            data['imageUrl'],
                            width: imageWidth,
                            height: imageHeight,
                          ),
                          SizedBox(width: spacing),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['title'],
                                  style: TextStyle(
                                    fontSize: titleFontSize,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: spacing / 2),
                                ...data['subtitle'].map((line) => Text(
                                  line,
                                  style: TextStyle(
                                    fontSize: subtitleFontSize,
                                    color: Colors.grey[400],
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
