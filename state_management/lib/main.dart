import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/ui/cart_screen.dart';
import 'package:state_management/ui/home_screen.dart';
import 'package:state_management/ui/login_screen.dart';
import 'package:state_management/ui/user_list_screen.dart';

// Để cho các widgets có thể đọc được vào các providers, ta cần wrap cả app lại
// bằng 1 cái scope 'ProviderScope'
void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      initialRoute: '/login',
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/cart': (context) => CartScreen(),
        '/user-list': (context) => UserListScreen(),
      },
    );
  }
}
