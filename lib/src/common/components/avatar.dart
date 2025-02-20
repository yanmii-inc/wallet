import 'package:flutter/material.dart';

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

  Color _getColorFromName(String name) {
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
    ];
    final hash = name.codeUnits.fold(0, (prev, element) => prev + element);
    return colors[hash % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: _getColorFromName(name),
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
