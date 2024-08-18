import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Notes",
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.grey.withOpacity(0.05),
            elevation: 0,
            child: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
