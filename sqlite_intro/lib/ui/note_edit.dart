import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlite_intro/providers/note_notifier.dart';

import '../model/note.dart';

class EditNote extends ConsumerStatefulWidget {
  final Note note;
  const EditNote({super.key, required this.note});

  @override
  ConsumerState<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends ConsumerState<EditNote> {
  // final _noteTitleController = TextEditingController();
  // final _noteContentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _noteTitleController;
  late TextEditingController _noteContentController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _noteTitleController = TextEditingController(text: widget.note.title);
    _noteContentController = TextEditingController(text: widget.note.content);
  }

  @override
  void dispose() {
    _noteTitleController.dispose();
    _noteContentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Edit note"),),
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
                    ref.read(noteProvider.notifier).updateNote( // widget.note.title
                        Note(id: widget.note.id,
                            title: _noteTitleController.text,
                            content: _noteContentController.text
                        )
                    );
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  }
                }, child: Text("Update"))
              ],
            )
        )
    );
  }
}
