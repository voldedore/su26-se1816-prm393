import 'package:flutter/material.dart';
import 'package:sqlite_intro/model/note.dart';

import 'note_edit.dart';

class NoteDetails extends StatelessWidget {
  final Note note;

  const NoteDetails({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        actions: [IconButton(onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditNote(note: note))
          );
        }, icon: Icon(Icons.edit))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: TextEditingController(text: note.title), readOnly: true,),
            TextField(controller: TextEditingController(text: note.content), readOnly: true),
          ],
        ),
      ),
    );
  }
}
