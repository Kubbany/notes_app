import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 16),
      child: Column(
        children: [
          CustomTextField(
            hintText: "Title",
            contentPadding: 25,
          ),
          CustomTextField(
            hintText: "Content",
            contentPadding: 55,
          ),
        ],
      ),
    );
  }
}
