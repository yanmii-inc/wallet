import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  const User({
    required this.uid,
    required this.email,
  });

  @HiveField(0)
  final String uid;

  @HiveField(1)
  final String email;

  @override
  String toString() => 'User(uid: $uid, email: $email)';
}
