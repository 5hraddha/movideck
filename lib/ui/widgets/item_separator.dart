import 'package:flutter/material.dart';

class ItemSeparator extends StatelessWidget {
  const ItemSeparator({super.key, required this.separatorColor});
  final Color separatorColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 3.0),
        Container(
          width: 5.0,
          height: 5.0,
          decoration: BoxDecoration(
            color: separatorColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 3.0),
      ],
    );
  }
}
