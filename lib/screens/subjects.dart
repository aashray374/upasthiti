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
      body: ListView.builder(itemCount: 7, itemBuilder: (context,index){
        return SubjectCard(subjectName: "Hello",);
      }),
    );
  }
}
