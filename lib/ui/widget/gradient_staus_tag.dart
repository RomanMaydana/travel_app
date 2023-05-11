import 'package:flutter/material.dart';
import 'package:travel_app/data/travel.dart';

class GradienStatusTag extends StatelessWidget {
  const GradienStatusTag({super.key, required this.statusTag});

  final StatusTag statusTag;
  @override
  Widget build(BuildContext context) {
    List<Color> colors;
    switch (statusTag) {
      case StatusTag.popular:
        colors = [Colors.amber, Colors.orange.shade600];
        break;
      default:
        colors = [Colors.cyan, Colors.blue.shade600];
    }
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10, horizontal: 20
      ),
      decoration: 
      BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(colors: colors)
      ),
      child: Text(statusTag.desc.toString()),
    );
  }
}
