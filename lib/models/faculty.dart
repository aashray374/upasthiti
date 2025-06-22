class Faculty {
  final int id;
  final String name;
  final String email;

  Faculty({
    required this.id,
    required this.name,
    required this.email,
  });

  factory Faculty.fromJson(Map<String, dynamic> json) => Faculty(
    id: json['id'],
    name: json['name'],
    email: json['email'],
  );
}
