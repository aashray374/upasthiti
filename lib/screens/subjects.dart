import 'package:flutter/material.dart';
import 'package:upasthiti/components/subject_card.dart';

class Subjects extends StatefulWidget {
  const Subjects({super.key});

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert), // The three dots icon
            onSelected: (value) {
              // Handle menu action here
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
      body : Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          _header(context),
          SizedBox(height: 40,),
          _displaySubjects(context),
        ],
      ),
    );
  }

  _header(context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "Your Subjects",
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      ),
    );
  }

  _displaySubjects(context){
    return Expanded(
      child: ListView.builder(itemCount: 7, itemBuilder: (context,index){
        return SubjectCard(subjectName: "hello",);
      }),
    );
  }
}
