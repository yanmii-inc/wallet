import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class AutoCloseExpandableFab extends StatelessWidget {
  const AutoCloseExpandableFab({
    required this.children,
    this.distance = 70,
    this.type = ExpandableFabType.up,
    this.childrenAnimation = ExpandableFabAnimation.none,
    this.icon = const Icon(Icons.add),
    super.key,
  });

  final List<Widget> children;
  final double distance;
  final ExpandableFabType type;
  final ExpandableFabAnimation childrenAnimation;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final fabKey = GlobalKey<ExpandableFabState>();

    return GestureDetector(
      onTap: () {
        if (fabKey.currentState?.isOpen ?? false) {
          fabKey.currentState?.toggle();
        }
      },
      behavior: HitTestBehavior.translucent,
      child: ExpandableFab(
        key: fabKey,
        type: type,
        distance: distance,
        childrenAnimation: childrenAnimation,
        openButtonBuilder: FloatingActionButtonBuilder(
          size: 56,
          builder: (context, onPressed, isOpen) => FloatingActionButton(
            onPressed: onPressed,
            child: icon,
          ),
        ),
        children: children,
      ),
    );
  }
}
