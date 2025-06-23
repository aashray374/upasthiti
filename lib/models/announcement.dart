class Announcement {
  final int id;
  final int subjectId;
  final String title;
  final String message;
  final DateTime date;

  Announcement({
    required this.id,
    required this.subjectId,
    required this.title,
    required this.message,
    required this.date,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
    id: json['id'],
    subjectId: json['subject_id'],
    title: json['title'],
    message: json['message'],
    date: DateTime.parse(json['date']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'subject_id': subjectId,
    'title': title,
    'message': message,
    'date': date.toIso8601String(),
  };
}
