import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/display_notes_cubit/display_notes_cubit.dart';
import 'package:notes_app/cubits/display_notes_cubit/display_notes_state.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayNotesCubit, DisplayNotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<DisplayNotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 15,
          ),
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: NoteCard(
                note: notes[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
