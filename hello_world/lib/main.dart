
// 4 types of parameter
// - Required
// - Optional []
// - Named param {}
// - Default =
import 'dart:convert';
import 'dart:math';

import 'package:hello_world/animal.dart';
import 'package:hello_world/post.dart';
import 'package:http/http.dart' as http;


void greet({required String name, int? age}) {
  if (age != null) {
    print('Hello $name, you are $age years old!');
  } else {
    print('Hello $name');
  }
}

// BT1 (gợi ý: optional param dùng [])
// Viết hàm String fullName
// Nhận vào 3 tham số: firstName, middleName, lastName (string)
// return:
// - fullName('John') => John
// - fullName('John', 'Mark', 'Zuck') => John Mark Zuck
// - fullName('John', 'Zuck') => John Zuck
void fullName(String? firstName, [String? middleName, String? lastName]){
  print('$firstName ${middleName ?? ''} ${lastName ?? ''}');
}
// BT2
// Viết hàm void describe
// Nhận 2 tham số String color, String size
// Logic:
// - describe(size: 'large')
//    => In ra 'This item is blue and large
// - describe(size: 'small', color: 'red')
//    => In ra 'This item is red and small
// - describe(color: 'red')
//    => In ra 'This item is red and medium
// - describe()
//    => In ra 'This item is blue and medium

// void main() {
//   print('Hello world');
//   greet(age: 38, name: 'John');
//   fullName('John');
//   fullName('John', 'Mark', 'Zuck');
//   fullName('John', 'Zuck');
// }

// Viết hàm void describe
// Nhận 2 tham số String color, String size
// Logic:
// - describe(size: 'large')
//    => In ra 'This item is blue and large
// - describe(size: 'small', color: 'red')
//    => In ra 'This item is red and small
// - describe(color: 'red')
//    => In ra 'This item is red and medium
// - describe()
//    => In ra 'This item is blue and medium

void describe({String color ='blue', String size = 'medium'}) {
  print('This item is $color and $size');
}

// Short hand (fat arrow)
double bp(double x) {
  return x * x;
}
double bp2(double x) => x * x;
void fly() {
  print('I am high');
}
void fly2() => print('I am 2');

// https://dummyjson.com/posts/5
// -> Viet 1 fn fetch Post
Future<Post> fetchPost(int id) async {
  final url = Uri.parse('https://dummyjson.com/posts/$id');
  final response = await http.get(url);
  // print(response.body);
  return Post.fromJson(jsonDecode(response.body));
}

Future<String> fetchUser() async {
  return Future.delayed(Duration(milliseconds: 1000), () => 'Jon Snow');
}

Stream<int> getNums() async* {
  // Logic
  yield 5;
  // Logic 2
  yield 6;
  // Logic 3
  yield 10;
}

// Viet 1 doan code xo so
// Cu moi 1s/500ms se in ra man hinh 1 so random (dung Random().nextInt(100))
// Neu ket qua la 79 thi ngung lai va in dong chu "Xin chuc mung".
Stream<int> luckyNumbers() async* {
  while (true) {
    await Future.delayed(Duration(milliseconds: 300));
    var n = Random().nextInt(100);
    yield n;
    if (n == 79) {
      break;
    }
  }
}
// BT2: Viet 1 doan code de tai ngau nhien 5 bai post, cho 2s giua moi lan tai.
// BT3: Viet 1 doan code de tai ngau nhien 5 Student (id, name, email, grade)
//      - API: https://jsonplaceholder.typicode.com/users/{id}
//      - cho 2 giay moi lan tai
//      - In ra man hinh Student (them 1 thuoc tinh la grade -> random 0-10)
void main() async {
  await for (var num in luckyNumbers()) {
    print(num);
    if (num == 79) {
      print('chuc mung');
    }
  }
  // Post p = await fetchPost(5);
  // p.displayInfo();
  // // init giao dien
  // // listen event...
  // print('Start...');
  // Future(() => 1).then((val) => val + 1).then((v) => print(v));
  // print('End...');
  // Future(() => print('2nd future'));
  // print('Finish');
  // var u = await fetchUser();
  // print(u);
  //
  // // Stream
  // getNums().listen((v) => print(v * 2));





  // describe(size: 'large');
  // describe(size: 'small', color: 'red');
  // describe(color: 'red');
  // describe();
  // print(bp(3));
  // print(bp2(4));
  // fly();
  // fly2();
  // Student s1 = Student();
  // s1.displayInfo();
  // Student s2 = Student.withDetails('Jon', 38, 95);
  // s2.displayInfo();
  // Student s3 = Student.fillStudentName('Mark');
  // s3.displayInfo();
  // s3.studentId = 'CE123456'; // Goi setter
  // print(s3.studentId); // Goi getter

  // Duck d = Duck('Donald', 60);
  // d.printInfo();
  // d.fly();
  // d.swim();
}

// BT
// Cho API tai
// https://dummyjson.com/posts
// Xây dựng lớp Post
// các thuộc tính: id, title, body
// các phương thức:
// - Khởi tạo (3 named param)
// - displayInfo
// - factory Post.fromJson(Map<String, dynamic> json) { ... }
// - Map<String, dynamic> toJson() { ... }
// OOP
class Student {
  String _studentId = '';
  String name = '';
  int age = 0;
  int grade = 0;

  Student(); // unamed constructor
  // Named constructor (Phương thức khỏi tạo được đặt tên)
  Student.withDetails(this.name, this.age, this.grade);
  Student.fillStudentName(this.name) : age = 18, grade = 0;

  String get studentId => _studentId; // Khai bao getter
  set studentId(String id) {          // khai bao setter
    if (id.length == 8) {
      _studentId = id;
    } else {
      throw ArgumentError('Invalid');
    }
  }
  void displayInfo() {
    print('Name: $name, Age: $age, Grade: $grade');
  }

}

