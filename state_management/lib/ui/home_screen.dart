import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/providers/user_provider.dart';

// Ví dụ không dùng StatefulWidget thì
// StatelessWidget có consumer được provider của chúng ta không?
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref watch (ngắm nhìn provider)
    final users = ref.read(userProvider);

    return Scaffold();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return const Placeholder();
  // }


}




// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends ConsumerState<HomeScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     // ref watch (ngắm nhìn provider)
//     final users = ref.watch(userProvider);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Users list'),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: GridView.count(
//         crossAxisCount: 4,
//
//         // children: List.generate(15, (i) {
//         //   return Card(child: Column(children: [Text('User 1')]));
//         // }),
//
//         children: users.map((u) {
//           return Card(child: Column(children: [Text(u.username)],),);
//         }).toList(),
//
//       ),
//     );
//   }
// }
