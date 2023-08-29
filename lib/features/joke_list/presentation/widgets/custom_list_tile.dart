import 'package:flutter/material.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget({
    super.key,
    required this.color,
    required this.joke,
    required this.count,
  });

  final Color color;
  final String joke;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.4),
          border: Border.all(color: color, width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(
            joke,
            style: const TextStyle(color: Colors.white),
          ),
          leading: Text(
            count.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          dense: true,
          minVerticalPadding: 10,
        ),
      ),
    );
  }
}
