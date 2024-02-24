import 'dart:ffi';

class User {
  final int id;
  final String username;
  final String name;
  final String avatarUrl;
  final String role;
  final String categoryAccount;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.avatarUrl,
    required this.role,
    required this.categoryAccount,
  });
}
