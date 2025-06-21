import 'package:flutter/material.dart';

class AllClassesScreen extends StatelessWidget {
  const AllClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy class data
    final List<Map<String, String>> classList = [
      {
        "type": "Lecture",
        "date": "22/06/25",
        "time": "10:00 AM - 11:00 AM",
        "location": "Room A101",
      },
      {
        "type": "Tutorial",
        "date": "23/06/25",
        "time": "12:00 PM - 1:00 PM",
        "location": "Room B202",
      },
      {
        "type": "Practical",
        "date": "24/06/25",
        "time": "2:00 PM - 4:00 PM",
        "location": "Lab 3",
      },
      {
        "type": "Lecture",
        "date": "25/06/25",
        "time": "9:00 AM - 10:00 AM",
        "location": "Room A102",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("All Classes"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: classList.length,
        itemBuilder: (context, index) {
          final classInfo = classList[index];
          return Card(
            color: Color(0xFF322F2F),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    classInfo['type'] ?? "",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 16, color: Colors.white70),
                      SizedBox(width: 6),
                      Text(classInfo['date'] ?? "", style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16, color: Colors.white70),
                      SizedBox(width: 6),
                      Text(classInfo['time'] ?? "", style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: Colors.white70),
                      SizedBox(width: 6),
                      Text(classInfo['location'] ?? "", style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
