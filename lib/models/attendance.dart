class Attendance {
  final int id;
  final int classId;
  final int studentId;
  final String status; // 'present', 'absent', 'cancelled'
  final DateTime date;

  Attendance({
    required this.id,
    required this.classId,
    required this.studentId,
    required this.status,
    required this.date,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
    id: json['id'],
    classId: json['class_id'],
    studentId: json['student_id'],
    status: json['status'],
    date: DateTime.parse(json['date']),
  );
}
