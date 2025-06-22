class Resource {
  final int id;
  final int subjectId;
  final String name;
  final String url;
  final DateTime uploadedAt;

  Resource({
    required this.id,
    required this.subjectId,
    required this.name,
    required this.url,
    required this.uploadedAt,
  });

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
    id: json['id'],
    subjectId: json['subject_id'],
    name: json['name'],
    url: json['url'],
    uploadedAt: DateTime.parse(json['uploaded_at']),
  );
}
