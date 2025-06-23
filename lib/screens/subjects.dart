import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upasthiti/components/subject_card.dart';

import '../models/subject.dart';

class Subjects extends StatefulWidget {
  const Subjects({super.key});

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  List<Subject> subjects = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchSubjects();
  }

  Future<void> _fetchSubjects() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    final url = Uri.parse("http://<YOUR_BACKEND_IP>:3000/api/student/subjects");

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        subjects = (data['subjects'] as List).map((json)=>Subject.fromJson(json)).toList();
        isLoading = false;
      });
    } else {
      print("Failed to load subjects: ${response.body}");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subjects"),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'import') {
                print('Import tapped');
              } else if (value == 'export') {
                print('Export tapped');
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'import', child: Text('Import Subjects')),
              const PopupMenuItem(value: 'export', child: Text('Export Timetable')),
            ],
          )
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _header(context),
          const SizedBox(height: 20),
          Expanded(child: _displaySubjects(context)),
        ],
      ),
    );
  }

  Widget _header(context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "Your Subjects",
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _displaySubjects(context) {
    return ListView.builder(
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        final subject = subjects[index];
        return SubjectCard(subjectName: subject.name); // Adjust if SubjectCard takes more props
      },
    );
  }
}
