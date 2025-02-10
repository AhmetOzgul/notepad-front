class NoteModel {
  int id;
  String title;
  String content;
  DateTime date;

  NoteModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.date});

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['noteId'],
      title: json['title'],
      content: json['content'],
      date: DateTime.parse(json['updatedAt']),
    );
  }
}
