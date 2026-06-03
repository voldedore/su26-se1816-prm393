import 'package:flutter/material.dart';
import 'package:widget_intro/login_success_screen.dart';
import 'package:widget_intro/screen_one.dart';
import 'package:widget_intro/screen_three.dart';
import 'package:widget_intro/screen_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      initialRoute: '/',
      routes: {'/login_success': (context) => LoginSuccessScreen()},
      home: const MyHomePage(title: 'Welcome to PRM393'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Danh sách các screen
  final List<Widget> screens = [];
  int _currentNavBarIndex = 0;

  @override
  void initState() {
    super.initState();
    screens.add(ScreenOne());
    screens.add(ScreenTwo());
    screens.add(ScreenThree());
    screens.add(ScreenThree());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(child: screens[_currentNavBarIndex]),
      drawer: Drawer( // Man hinh an ben trai
        child: ListView(children: [ListTile(title: Text('Menu 1'))]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (v) => {
          setState(() {
            _currentNavBarIndex = v;
          }),
        },
        currentIndex: _currentNavBarIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            label: 'Widgets',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.grid_view),
            label: 'Grid & List',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.cloud),
            label: 'Cloud',
          ),
        ],
      ),
    );
  }
}
