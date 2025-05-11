import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  const User({
    required this.uid,
    required this.email,
    this.fullName,
  });

  @HiveField(0)
  final String uid;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String? fullName;

  @override
  String toString() => 'User(uid: $uid, email: $email, fullName: $fullName)';
}
