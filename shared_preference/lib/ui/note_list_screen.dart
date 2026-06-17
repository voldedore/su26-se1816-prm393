import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preference/providers/note_notifier.dart';

class NoteListScreen extends ConsumerStatefulWidget {
  const NoteListScreen({super.key});

  @override
  ConsumerState<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends ConsumerState<NoteListScreen> {
  @override
  Widget build(BuildContext context) {
    // Lay notes từ noteProvider
    final notes = ref.watch(noteProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Note management')),
      body: GridView.count(
        crossAxisCount: 2,
        children: notes
            .map(
              (note) => Card(
                child: Column(children: [Text(note.title), Text(note.content)]),
              ),
            )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(noteProvider.notifier).addNote('Note', 'Hello world');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
