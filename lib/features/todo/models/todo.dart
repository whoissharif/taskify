class Todo {
  final int? id;
  final String title;
  final DateTime date;
  bool isDone;

  Todo({this.id, required this.title, this.isDone = false, required this.date});

  void toggleDone() {
    isDone = !isDone;
  }

  factory Todo.fromMap(Map<String, dynamic> json) => Todo(
        id: json['id'],
        title: json['title'],
        date: DateTime.parse(json['date']),
        isDone: json['iscomplete'] == 1 ? true : false,
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date.toIso8601String(),
      'iscomplete': isDone,
    };
  }
}
