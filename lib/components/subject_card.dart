import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  final String? subjectName;
  const SubjectCard({super.key, this.subjectName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(subjectName!),
    );
  }
}
