import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlite_intro/providers/note_notifier.dart';
import 'package:sqlite_intro/ui/add_note_page.dart';

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
    final notes = ref.watch(noteProvider);
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
