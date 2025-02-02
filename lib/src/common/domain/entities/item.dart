// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive_flutter/hive_flutter.dart';

part 'item.g.dart';

/// Object that the UI needs.
///
@HiveType(typeId: 2)
class Item {
  const Item({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.profileImg,
  });

  @HiveField(0)
  final int id;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final String thumbnail;

  @HiveField(5)
  final String profileImg;
}
