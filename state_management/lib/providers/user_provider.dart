import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/models/user.dart';

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

// Khai báo user provider
final userProvider = Provider((ref) {
  return allUsers;
});

final totalUsersCountProvider = Provider((ref) {
  return allUsers.length;
});