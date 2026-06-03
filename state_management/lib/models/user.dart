class User {
  final int id;
  final String username;
  final String email;

  const User({required this.id, required this.username, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    // { 'id'


    return User(id: json['id'], username: json['username'], email: json['email']);
  }

  // Student s = Student(8, 'Jon');
}