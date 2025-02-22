import 'package:flutter/material.dart';
import 'package:yanmii_wallet/src/utils/color_utils.dart';

class NameAvatar extends StatelessWidget {
  const NameAvatar({
    required this.name,
    super.key,
    this.size = 40.0,
  });
  final String name;
  final double size;

  String _getInitials(String name) {
    final nameParts = name.trim().split(RegExp(r'\s+'));

    if (nameParts.isEmpty) return '';

    if (nameParts.length == 1) {
      return nameParts.first
          .substring(0, nameParts.first.length > 2 ? 3 : nameParts.first.length)
          .toUpperCase();
    } else {
      return (nameParts[0][0] +
              nameParts[1][0] +
              (nameParts.length > 2 ? nameParts[2][0] : ''))
          .toUpperCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: ColorUtils.getColorFromName(name),
      child: Text(
        _getInitials(name),
        style: TextStyle(
          color: Colors.white,
          fontSize: size * 0.4,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
