class Student {
  final int id;
  final String enrollmentNo;
  final String name;

  Student({
    required this.id,
    required this.enrollmentNo,
    required this.name,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    id: json['id'],
    enrollmentNo: json['enrollment_no'],
    name: json['name'],
  );
}
