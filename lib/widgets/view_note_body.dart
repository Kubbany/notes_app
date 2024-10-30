import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';

class ViewNoteBody extends StatelessWidget {
  const ViewNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    NoteModel note = ModalRoute.of(context)!.settings.arguments as NoteModel;
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(
            title: note.title,
            heroTag: "EditButton",
            icon: Icons.edit,
            onPressed: () {
              Navigator.pushNamed(
                context,
                EditNoteView.id,
                arguments: note,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 15,
            ),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                note.subtitle,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
