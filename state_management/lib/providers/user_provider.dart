import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management/models/user.dart';

// Ý nghĩa: File hiện tại (user_provider.dart) còn có 1 phần code nữa
// nằm trong 1 file khác tên gọi là 'user_provider.g.dart'
// Để có file "part" này, ta chạy lệnh `dart run build_runner build`
// Naming convention = tên của file được gen lấy từ tên file hiện tại + '.g.dart'
part 'user_provider.g.dart';

// Dùng thử 1 mảng cứng để làm state cho provider
const List<User> allUsers = [
  User(id: 1, username: 'jon', email: 'jon@mail.com'),
  User(id: 2, username: 'mark', email: 'mark@mail.com'),
  User(id: 3, username: 'nguyen', email: 'nguyen@mail.com'),
  User(id: 4, username: 'joe', email: 'joe@mail.com'),
  User(id: 5, username: 'alice', email: 'alice@mail.com'),
  User(id: 6, username: 'bob', email: 'bob@mail.com'),
  User(id: 7, username: 'joli', email: 'joli@mail.com'),
];
// MANUAL - Thực hiện khai báo Provider thủ công
// Khai báo user provider
// final userProvider = Provider((ref) {
//   return allUsers;
// });
//
// final totalUsersCountProvider = Provider((ref) {
//   return allUsers.length;
// });

// GENERATOR - Tự gen ra provider
// Naming convention = tên fn + suffix 'Provider'
//                       user +        Provider = userProvider
@riverpod
List<User> user(ref) {
  return allUsers;
}
