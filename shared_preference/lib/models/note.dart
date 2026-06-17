class Note {
  final int id;
  final String title;
  final String content;

  Note({required this.id, required this.title, required this.content});

  /*
  [{
    id: 7,
    title: 'My first note',
    content: 'This is the content of the 1st note'
  },
  {
    id: 9,
    title: '2nd note',
    content: 'This is the content of the note'
  }]
   */

  // 1. LocalStorge(String) -> thu vien convert -> JSON -> fromJSON() -> object
  factory Note.fromJSON(Map<String, dynamic> json) {
    return Note(id: json['id'], title: json['title'], content: json['content']);
  }

  // 2. object -> toJSON() -> thu vien convert -> string -> LocalStorage
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'content': content};
  }
}
