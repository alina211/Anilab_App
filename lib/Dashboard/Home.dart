import 'package:anilab_app/Login-Register/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore package

class DashboardScreen extends StatelessWidget {
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Dashboard", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white70),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white70),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'logout') {
                  _logout(context);
                }
              },
              icon: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxx6d4MF1uqLR28B7P6DV0o9FZGAvuOkiaRQhxhdqiEWnI8hT9L3W7jJSlTyHzjnSiUg&usqp=CAU',
                ),
                radius: 18,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'logout',
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.red),
                      SizedBox(width: 8),
                      Text("Logout"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 10),
                  _buildGraphSection(),
                  SizedBox(height: 20),
                  _buildPieChartSection(),
                  SizedBox(height: 20),
                  _buildDataTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[850],
      child: Column(
        children: [
          SizedBox(height: 16),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.cancel, color: Colors.white70),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/be/18/39/be18398b-13a6-7493-5098-3cc16910a9e8/AppIcon-0-0-1x_U007ephone-0-1-85-220.jpeg/256x256bb.jpg'),
            radius: 40,
          ),
          SizedBox(height: 20),
          Text(
            "Welcome to Anilab's Dashboard",
            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 25),
          ListTile(
            leading: Icon(Icons.home, color: Colors.white),
            title: Text("Home", style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.insert_chart, color: Colors.white),
            title: Text("Insights", style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.map, color: Colors.white),
            title: Text("Map", style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text("Settings", style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildGraphSection() {
    return Container(
      height: 200,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))],
      ),
      child: LineChart(LineChartData(
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: [FlSpot(0, 1), FlSpot(2, 3), FlSpot(4, 10), FlSpot(6, 7)],
            isCurved: true,
            barWidth: 4,
            color: Colors.cyanAccent,
          ),
        ],
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          horizontalInterval: 2,
          getDrawingHorizontalLine: (value) => FlLine(color: Colors.white24, strokeWidth: 1),
        ),
      )),
    );
  }

  Widget _buildPieChartSection() {
    return Container(
      height: 200,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(4, (index) => _buildPieChart()),
      ),
    );
  }

  Widget _buildPieChart() {
    return PieChart(PieChartData(
      sections: [
        PieChartSectionData(value: 40, color: Colors.blueAccent, title: '40%', titleStyle: TextStyle(color: Colors.white)),
        PieChartSectionData(value: 30, color: Colors.greenAccent, title: '30%', titleStyle: TextStyle(color: Colors.white)),
        PieChartSectionData(value: 15, color: Colors.orangeAccent, title: '15%', titleStyle: TextStyle(color: Colors.white)),
        PieChartSectionData(value: 15, color: Colors.redAccent, title: '15%', titleStyle: TextStyle(color: Colors.white)),
      ],
      borderData: FlBorderData(show: false),
    ));
  }

  Widget _buildDataTable() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))],
      ),
      child: StreamBuilder<QuerySnapshot>(
        stream: usersCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No registered users found.'));
          }

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingTextStyle: TextStyle(color: Colors.white70),
              dataTextStyle: TextStyle(color: Colors.white),
              columns: [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Username')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Registered At')),
                DataColumn(label: Text('Favorite Genre')),
                DataColumn(label: Text('Actions')), // New column for actions
              ],
              rows: snapshot.data!.docs.map((userDoc) {
                Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
                return DataRow(cells: [
                  DataCell(Text(userDoc.id)),
                  DataCell(Text(userData['username'] ?? 'Unknown')),
                  DataCell(Text(userData['email'] ?? 'No email provided')),
                  DataCell(Text(userData['registeredAt'] != null
                      ? "${userData['registeredAt']['date']} ${userData['registeredAt']['time']}"
                      : 'Not specified')),
                  DataCell(Text(userData['favoriteGenre'] ?? 'Not specified')),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteUser(userDoc.id), // Call _deleteUser on delete
                    ),
                  ),
                ]);
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  Future<void> _deleteUser(String userId) async {
    try {
      await usersCollection.doc(userId).delete();
      print("User deleted successfully.");
    } catch (e) {
      print("Failed to delete user: $e");
    }
  }
}
