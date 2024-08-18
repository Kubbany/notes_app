import 'package:flutter/material.dart';
import 'package:notes_app/widgets/note_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17),
      child: ListView.builder(
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: NoteCard(),
        ),
      ),
    );
  }
}
