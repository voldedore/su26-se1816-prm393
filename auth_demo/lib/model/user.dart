class User {
  int id;
  String username;
  String email;
  String accessToken;
  String refreshToken;

  User(this.id, this.username, this.email, this.accessToken,
      this.refreshToken);

  // fromJSON
  factory User.fromJSON(Map<String, dynamic> json) {
    return User(json['id'],
        json['username'],
        json['email'],
        json['accessToken'],
        json['refreshToken']
    );
  }

  // toJSON
  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'accessToken': accessToken,
      'refreshToken': refreshToken
    };
  }
}