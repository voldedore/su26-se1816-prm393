import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/providers/cart_notifier.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final items = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Your cart'),
      ),
      body: ListView(
        // children: [
        //   ListTile(
        //     title: Text('Black hat'),
        //     subtitle: Text('\$9'), // escape char
        //   ),
        //   ListTile(
        //     title: Text('Black hat'),
        //     subtitle: Text('\$9'),
        //   ),
        //   ListTile(
        //     title: Text('Black hat'),
        //     subtitle: Text('\$9'),
        //   ),
        // ],
        children: items.map((item) {
          return ListTile(
            title: Text(item.name),
            subtitle: Text('${item.price}'),
            trailing: IconButton(
              onPressed: () {
                ref.read(cartProvider.notifier).removeItem(item.id);
              },
              icon: const Icon(Icons.delete),
            ),
          );
        }).toList(),
      ),
    );
  }
}
