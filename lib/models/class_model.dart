class ClassModel {
  final int id;
  final int subjectId;
  final String type;
  final String? day;
  final DateTime? date;
  final String startTime;
  final String endTime;

  ClassModel({
    required this.id,
    required this.subjectId,
    required this.type,
    this.day,
    this.date,
    required this.startTime,
    required this.endTime,
  });

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
    id: json['id'],
    subjectId: json['subject_id'],
    type: json['type'],
    day: json['day'],
    date: json['date'] != null ? DateTime.parse(json['date']) : null,
    startTime: json['start_time'],
    endTime: json['end_time'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'subject_id': subjectId,
    'type': type,
    'day': day,
    'date': date?.toIso8601String(),
    'start_time': startTime,
    'end_time': endTime,
  };
}
