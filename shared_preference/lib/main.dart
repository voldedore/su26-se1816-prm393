import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preference/providers/shared_preferences_provider.dart';
import 'package:shared_preference/ui/note_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Đảm bảo app Flutter sẽ được Binding
  WidgetsFlutterBinding.ensureInitialized();

  // Lấy instance của share preferences (local storage) từ hệ thống
  final sharedPreferences = await SharedPreferences.getInstance();

  // Override lại provider của sharedPreferences
  // Bằng giá trị (instance phía trên mà ht cho mình), vào trong data của provider.
  runApp(ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences)
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NoteListScreen(),
    );
  }
}
