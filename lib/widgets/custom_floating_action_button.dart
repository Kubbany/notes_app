import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
      ),
      child: const Icon(
        Icons.add,
        color: Colors.black,
      ),
    );
  }
}
