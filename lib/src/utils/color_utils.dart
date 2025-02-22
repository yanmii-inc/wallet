import 'package:flutter/material.dart';

class ColorUtils {
  static Color getColorFromName(String name) {
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.amber,
      Colors.cyan,
      Colors.lime,
      Colors.indigo,
      Colors.brown,
      Colors.grey,
      Colors.blueGrey,
    ].map((color) => color.shade700).toList(); // Use darker shades

    // Hash the string to a consistent index
    final hash = name.hashCode;
    // Use modulo to wrap the hash within the available colors
    final index = hash.abs() % colors.length;
    return colors[index];
  }
}
