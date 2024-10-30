import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.heroTag,
    required this.icon,
    required this.onPressed,
  });
  final String title;
  final String heroTag;
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
          FloatingActionButton(
            onPressed: onPressed,
            heroTag: heroTag,
            backgroundColor: Colors.grey.withOpacity(0.05),
            elevation: 0,
            child: Icon(
              icon,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
