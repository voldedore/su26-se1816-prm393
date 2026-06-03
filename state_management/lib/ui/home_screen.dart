import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/models/product.dart';
import 'package:state_management/providers/cart_notifier.dart';
import 'package:state_management/providers/user_provider.dart';

// Ví dụ không dùng StatefulWidget thì
// StatelessWidget có consumer được provider của chúng ta không?
// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // ref watch (ngắm nhìn provider)
//     // read đọc 1 lần vào data (state) của provider
//     // watch theo dõi (được cập nhật theo) nếu data (state) của provider có thay đổi
//     final users = ref.read(userProvider);
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Home')),
//       body: GridView.count(crossAxisCount: 3, children: [
//
//       ]),
//     );
//   }
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return const Placeholder();
//   // }
// }

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    // ref watch (ngắm nhìn provider)
    final users = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products list'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(onPressed: () {
            // Di chuyen qua man hinh Cart Screen
            Navigator.pushNamed(context, '/cart');
          }, icon: Badge(
            label: Text('0'),
            child: Icon(Icons.shopping_cart),
          ))
        ],
      ),
      body: GridView.count(
        crossAxisCount: 4,

        // children: List.generate(15, (i) {
        //   return Card(child: Column(children: [Text('User 1')]));
        // }),

        children: List.generate(20, (i) {
          return Card(
              child: Column(
                children: [
                  Text('Product ${i + 1}'),
                  IconButton(
                      onPressed: () {
                        // Goi addItem của cart notifier (cartProvider)
                        ref.read(cartProvider.notifier).addItem(
                            Product(
                                id: i + 1,
                                name: 'Product ${i + 1}',
                                price: 50
                            )
                        );
                      },
                      icon: Icon(Icons.add_shopping_cart)
                  )
                ],
              )
          );
        }),

      ),
    );
  }
}
