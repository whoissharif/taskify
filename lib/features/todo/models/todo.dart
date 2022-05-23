class Todo {
  final int? id;
  final String title;
  final DateTime date;
  bool isDone;
  final int colorIndex;

  Todo({
    this.id,
    required this.title,
    this.isDone = false,
    required this.date,
    required this.colorIndex,
  });

  void toggleDone() {
    isDone = !isDone;
  }

  factory Todo.fromMap(Map<String, dynamic> json) => Todo(
        id: json['id'],
        title: json['title'],
        date: DateTime.parse(json['date']),
        isDone: json['iscomplete'] == 1 ? true : false,
        colorIndex: json['colorIndex'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date.toIso8601String(),
      'iscomplete': isDone,
      'colorIndex': colorIndex,
    };
  }
}
