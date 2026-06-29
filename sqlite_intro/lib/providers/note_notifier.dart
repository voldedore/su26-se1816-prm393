import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqlite_intro/db/database_helper.dart';
import 'package:sqlite_intro/model/note.dart';

part 'note_notifier.g.dart';

@riverpod
class NoteNotifier extends _$NoteNotifier {
  // P/thuc build la state cua providers
  @override
  Future<List<Note>> build() async {
    return DatabaseHelper.instance.getList();
  }
}