import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ToDoItem {
  final int? id;
  final String title;
  final String description;
  final bool isDone;
  ToDoItem({
    this.id,
    required this.title,
    required this.description,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
    };
  }

  factory ToDoItem.fromMap(Map<String, dynamic> map) {
    return ToDoItem(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] as String,
      description: map['description'] as String,
      isDone: map['isDone'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ToDoItem.fromJson(String source) => ToDoItem.fromMap(json.decode(source) as Map<String, dynamic>);

  ToDoItem copyWith({
    int? id,
    String? title,
    String? description,
    bool? isDone,
  }) {
    return ToDoItem(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  String toString() {
    return 'ToDoItem(id: $id, title: $title, description: $description, isDone: $isDone)';
  }
}
