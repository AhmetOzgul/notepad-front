class NoteModel {
  int id;
  String title;
  String content;
  DateTime updatedAt;
  DateTime createdAt;

  NoteModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.updatedAt,
      required this.createdAt});

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['noteId'],
      title: json['title'],
      content: json['content'],
      updatedAt: DateTime.parse(json['updatedAt']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
