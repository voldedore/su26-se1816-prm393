import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlite_intro/providers/note_notifier.dart';
import 'package:sqlite_intro/ui/add_note_page.dart';
import 'package:sqlite_intro/ui/note_details.dart';

void main() {
  // Ensure co bind (vi phai doc va ghi vao disk cua device)
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final notesAsyncValue = ref.watch(
      noteProvider,
    ); // kieu du lieu return cua provider build()
    return Scaffold(
      appBar: AppBar(
        title: Text("Note management"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          // Thêm assets trong pubspec.yaml

          // 1st way
          // Image.asset(
          //   "images/banner.png",
          //   height: 150,
          //   // width: 400,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),

          // 2nd way
          Image(
            image: AssetImage("images/banner.png"),
            height: 150,
            width: .infinity,
            fit: .cover,
          ),

          // Bai tap: Show danh sách Note trong DB (noteProvider)
          // 1) Dùng ListView để show mỗi ListTile là 1 note
          //    Phía sau (trailing), cho 1 Icon delete
          // Sự kiện onPress của icon này, sẽ xóa note ra khỏi db
          // 2) Viết hàm delete trong notedao (lớp DatabaseHelper)
          // 3) Viết hàm delete trong notifier (UI chỉ giao tiếp qua notifier)
          //
          Expanded(
            child: notesAsyncValue.when(
              data: (notes) => notes.isEmpty
                  ? Text('No notes yet. Please create one.')
                  : ListView.builder(
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        final note = notes[index];
                        return ListTile(
                          title: Text(note.title),
                          subtitle: Text(note.content),
                          onTap: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => NoteDetails(note: note))
                            );
                          },
                          trailing: IconButton(
                            onPressed: () {
                              ref.read(noteProvider.notifier).deleteNoteById(note.id!);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        );
                      },
                    ),
              error: (err, stack) => Text('There is an error loading notes.'),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNotePage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
