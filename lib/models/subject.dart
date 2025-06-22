class Subject {
  final int id;
  final String name;
  final int facultyId;

  Subject({
    required this.id,
    required this.name,
    required this.facultyId,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    id: json['id'],
    name: json['name'],
    facultyId: json['faculty_id'],
  );
}
