import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  final String? subjectName;
  const SubjectCard({super.key, this.subjectName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.purple,
            width: 2
          )
        ),
        child: ListTile(
          onTap: (){

          },
          title: Text(subjectName!),
        ),
      ),
    );
  }
}
