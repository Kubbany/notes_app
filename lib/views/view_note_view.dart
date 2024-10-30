import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/view_note_body.dart';

class ViewNoteView extends StatelessWidget {
  const ViewNoteView({super.key});
  static const String id = kViewNoteId;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ViewNoteBody(),
    );
  }
}
