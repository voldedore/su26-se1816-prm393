import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/product.dart';

part 'cart_notifier.g.dart';

/************************** MANUAL **********************/
// Notifier >< Provider
// Khai báo Notifer
// class CartNotifier extends Notifier<List<Product>> {
//   @override
//   List<Product> build() {
//     return [
//       Product(id: 1, name: 'T-shirt', price: 80),
//       Product(id: 1, name: 'Jeans', price: 30),
//       Product(id: 1, name: 'Hat', price: 120),
//     ];
//   }
//   // Có thể viết thêm các p/thức khác để thao tác, quản lý state
// }
// // Tạo notifierProvider
// final cartNotifierProvider = NotifierProvider<CartNotifier, List<Product>>(() {
//   return CartNotifier();
// });

/*********************** GENERATOR *******************/
// @Riverpod(keepAlive: true)
@riverpod
class CartNotifier extends _$CartNotifier {
  // fn build() -> init value (state)
  // Generator sẽ dựa trên Data type trả về của fn build()
  // để xác định data type cho state
  @override
  List<Product> build() {
    return [
      Product(id: 1, name: 'T-shirt', price: 80),
      Product(id: 2, name: 'Jeans', price: 30),
      Product(id: 3, name: 'Hat', price: 120),
      Product(id: 4, name: 'Fedora', price: 680),
    ];
  }

  // Các p/thức QL state
  void addItem(Product product) {
    print('Adding product ${product.id}');
    print('Before state contains ${state.length} items');
    // Ko dùng cách state.add()
    // state.add(product);
    state = [
      ...state,
      product,
    ]; //-> state được flutter quản lý theo ref trong mem
    // gán lại object state = obj cũ + data mới -> ref mới -> có tín hiệu state mới -> re render
    print('After state contains ${state.length} items');
  }

  // removeItem theo ID
  void removeItem(int productId) {
    state = state.where((item) => item.id != productId).toList();
  }

  // clear cart
  void clearCart() {
    state = [];
  }
}

// Lưu ý:
// 1. Naming convention (tên của provider được generated)
// Tên lớp         -> bỏ suffix `Notifier` -> thêm suffix `Provider`
// CartNotifier    ->       Cart           ->          CartProvider
// 2. Lớp _$CartNotifier -> viết tắt của Notifier<>

// Dependent provider
// Provider -> count so item trong cart
@riverpod
int totalItems(ref) {
  return ref.watch(cartProvider).length;
}
