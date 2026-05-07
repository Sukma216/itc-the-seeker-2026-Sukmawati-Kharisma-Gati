import 'package:flutter/material.dart';
import 'structurescreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF1B5E20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Color(0xFF1B5E20), size: 30),
                  ),
                  SizedBox(height: 10),

                  Text(
                    'Sukma',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    'ITC Member',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            // ini buat yg di drawer, yang muncul kalo burger 3 nya di klik 
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About ITC'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Organization Structure'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StructureScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Divisions'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('Activities'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact'),
              onTap: () {},
            ),
          ],
        ),
      ),

      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Text(
              'Hi, Sukma!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.7,
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFF1B5E20),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Information Technology Club',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'ITC is a study group for Informatics students at UPNVY,'
                    'focused on learning and developing interests and skills in'
                    'technology through 6 divisions.',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // KETUA
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child : Center(
                child: Text(
                'ITC Leader ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
              
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Card(
                elevation: 4,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFF1B5E20),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text('Grace Rianty Butar Butar'),
                  subtitle: Text('Chairman'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStat('6', 'Division'),
                _buildStat('50+', 'Member'),
              ],
            ),
             const SizedBox(height: 30),

            //  DIVISI
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child : Center(
                child: Text(
                'ITC Division',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
              
            ),

            const SizedBox(height: 10),

            _buildDivisionRow('Artificial Intelligence', 'Competitive Programming'),
            _buildDivisionRow('Web Development', 'Mobile Development'),
            _buildDivisionRow('UI/UX Design', 'Project Manager'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
Widget _buildDivisionRow(String left, String right) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    child: Row(
      children: [
        Expanded(child: _buildDivisionItem(left)),
        const SizedBox(width: 10),
        Expanded(child: _buildDivisionItem(right)),
      ],
    ),
  );
}
Widget _buildStat(String number, String label) {
  return Column(
    children: [
      Text(number, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      Text(label),
    ],
  );
}

Widget _buildDivisionItem(String title) {
  return Card(
    elevation: 1,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.circle, size: 8, color: Color(0xFF1B5E20)),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              title,
              style: const TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}