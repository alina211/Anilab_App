import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'SeriesDetail.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Anime Series')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('series').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var series = snapshot.data!.docs[index];
              return ListTile(
                leading: Image.network(series['thumbnailUrl']),
                title: Text(series['name']),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   // MaterialPageRoute(builder: (context) => SeriesDetailScreen(series.id)),
                  // );
                },
              );
            },
          );
        },
      ),
    );
  }
}
