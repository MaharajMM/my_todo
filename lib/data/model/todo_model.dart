import 'dart:convert';

class TodoModel {
  final String id;
  final String title;
  final bool isCompleted;

  TodoModel({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  TodoModel copyWith({
    String? id,
    String? title,
    bool isCompleted = false,
  }) =>
      TodoModel(
        id: id ?? this.id,
        title: title ?? this.title,
        isCompleted: isCompleted,
      );

  factory TodoModel.fromJson(String str) => TodoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TodoModel.fromMap(Map<String, dynamic> json) => TodoModel(
        id: json["id"],
        title: json["title"],
        isCompleted: json["is_completed"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "is_completed": isCompleted,
      };
}
