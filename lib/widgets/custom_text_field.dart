import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hintText, this.contentPadding = 0});
  final String hintText;
  final double contentPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: TextField(
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(kPrimaryColor),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: kPrimaryColor,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: contentPadding, horizontal: 16),
        ),
      ),
    );
  }

  buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
