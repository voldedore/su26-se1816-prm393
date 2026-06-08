
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
    );
  }
}

/*
BAI TAP

1. Viết 1 widget UserListScreen
2. Thiết kế 2 button: Fetch & Clear
3. Class User (id, name, email)
4. Xây dựng 1 Notifier -> state List<User>
5. - build() -> init value []
6. - fetch() : Cho API endpoint: GET https://jsonplaceholder.typicode.com/users
      Nhận KQ -> lưu vào state.
7. - clear(): Clear state.

Bonus: Nghiên cứu block UI bằng Loading screen trong khi API đang chờ nhận KQ
 */
