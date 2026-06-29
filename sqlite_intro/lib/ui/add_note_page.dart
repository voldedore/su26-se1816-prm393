import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlite_intro/providers/note_notifier.dart';

import '../model/note.dart';

class AddNotePage extends ConsumerStatefulWidget {
  const AddNotePage({super.key});

  @override
  ConsumerState<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends ConsumerState<AddNotePage> {
  final _noteTitleController = TextEditingController();
  final _noteContentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _noteTitleController.dispose();
    _noteContentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new note"),),
      body: Form(
        key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _noteTitleController,
                decoration: InputDecoration(labelText: "Title"),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Please type title content";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _noteContentController,
                decoration: InputDecoration(labelText: "Content"),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Please type note content";
                  }
                  if (v.length < 5) {
                    return "Content must be more than 5 char";
                  }

                  return null;
                },
              ),
              ElevatedButton(onPressed: () {
                // Valid
                if (_formKey.currentState!.validate()) {
                  // Goi logic de tao note moi
                  // Goi NoteNotifier
                  ref.read(noteProvider.notifier).addNote(
                      Note(title: _noteTitleController.text, content: _noteContentController.text)
                  );
                  Navigator.pop(context);
                }
              }, child: Text("Add"))
            ],
          )
      )
    );
  }
}
