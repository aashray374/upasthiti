import 'package:flutter/material.dart';
import 'package:upasthiti/screens/subjects.dart';

class SubjectDetailsSt extends StatelessWidget {
  const SubjectDetailsSt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'edit') {
                print('Edit tapped');
              } else if (value == 'delete') {
                print('Delete tapped');
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'import',
                child: Text('Import Subjects'),
              ),
              PopupMenuItem<String>(
                value: 'export',
                child: Text('Export Timetable'),
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              _topPart(context),
              _componentsDropdown(context),
              SizedBox(height: 16),
              _upcoming(context),
              SizedBox(height: 16),
              _announcementsSection(context),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  _topPart(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Subject Name",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text("80%",
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          SizedBox(
            height: 12,
            child: LinearProgressIndicator(
              value: 0.85,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
            ),
          ),
          SizedBox(height: 8),
          Text("Required: 75%"),
          SizedBox(height: 24)
        ],
      ),
    );
  }

  Widget _buildComponentRow({
    required String type,
    required String short,
    required String attended,
    required String weight,
    required Color color,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: Text(
            short,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(type,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Attended: $attended",
                      style: TextStyle(color: Colors.white70)),
                  Text("Weight: $weight",
                      style: TextStyle(color: Colors.white70)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _componentsDropdown(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        color: Color(0xFF322F2F),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: Text(
              "Components",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            iconColor: Colors.white,
            collapsedIconColor: Colors.white70,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  children: [
                    _buildComponentRow(
                      type: "Lecture",
                      short: "L",
                      attended: "8/10",
                      weight: "2",
                      color: Colors.deepPurpleAccent,
                    ),
                    SizedBox(height: 16),
                    _buildComponentRow(
                      type: "Tutorial",
                      short: "T",
                      attended: "7/10",
                      weight: "1",
                      color: Colors.blueAccent,
                    ),
                    SizedBox(height: 16),
                    _buildComponentRow(
                      type: "Practical",
                      short: "P",
                      attended: "9/10",
                      weight: "1",
                      color: Colors.green,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _upcoming(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Subjects()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Color(0xFF322F2F),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Upcoming Classes",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Icon(Icons.navigate_next, color: Colors.white),
                  ],
                ),
                SizedBox(height: 6),
                Text("View all classes", style: TextStyle(color: Colors.white70)),
                SizedBox(height: 16),
                Text("Next Class: 22/08/25",
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _announcementsSection(BuildContext context) {
    final announcements = [
      "Assignment 3 is due on 25th June",
      "Lecture on 22nd June is canceled",
      "New tutorial uploaded in LMS",
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Color(0xFF322F2F),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Announcements",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 16),
              ...announcements.map((text) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Icon(Icons.campaign, color: Colors.white70, size: 20),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        text,
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
