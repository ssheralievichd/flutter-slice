class ExampleModel {
  final String id;
  final String title;
  final String description;
  final DateTime createdAt;

  ExampleModel({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  factory ExampleModel.fromJson(Map<String, dynamic> json) {
    return ExampleModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
