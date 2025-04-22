/// Entity representing user information.
class User {
  final String id;
  final String name;
  final String email;
  final String profileImageUrl;

  User({
    required this.id,
    required this.name,
    required this.profileImageUrl,
    required this.email,
  });

  /// Factory method to create a User from JSON.
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
    );
  }
}
