import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preference/providers/shared_preferences_provider.dart';
import '../models/note.dart';

part 'note_notifier.g.dart';

@riverpod
class NoteNotifier extends _$NoteNotifier {
  // Khai báo key để lưu data vào shared preferences
  static const String _noteKey = 'notes';

  @override
  List<Note> build() {
    _loadNotes();
    return [];
  }

  // List
  void _loadNotes() {
    // Gọi provider của shared preferences để lấy instance của shared pref
    final prefs = ref.read(sharedPreferencesProvider);

    // connect vào local storage để lấy dữ liệu theo cái key đã set
    final noteJson = prefs.getStringList(_noteKey) ?? [];
    state = noteJson.map((str) => Note.fromJSON(json.decode(str))).toList();
  }

  // add
  Future<void> addNote(String title, String content) async {
    // new object note
    final newNote = Note(
        id: DateTime.now().millisecondsSinceEpoch,
        title: title,
        content: content
    );

    // Cap nhat lai state (phuc vu cho re-render UI)
    // state: List<Note> xem lai build() phia tren
    state = [...state, newNote];
    await _saveNotes();
  }

  Future<void> _saveNotes() async {
    // Save vao shared pref
    final prefs = ref.read(sharedPreferencesProvider);
    final noteStringList = state.map((note) => json.encode(note.toJson())).toList();
    await prefs.setStringList(_noteKey, noteStringList);
  }

  // delete
  // Note id = 3
  Future<void> deleteNote(int id) async {
    state = state.where((note) => note.id != id).toList();
    await _saveNotes();
  }

  // update
}