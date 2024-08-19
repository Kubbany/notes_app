import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 38,
      backgroundColor: Colors.blue,
    );
  }
}

class ColorsListView extends StatelessWidget {
  const ColorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ColorItem();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemCount: 10,
      ),
    );
  }
}
