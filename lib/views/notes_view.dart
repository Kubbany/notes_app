import 'package:flutter/material.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});
  static const String id = "NotesView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: NotesViewBody(),
      ),
    );
  }
}
