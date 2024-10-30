import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/display_notes_cubit/display_notes_cubit.dart';
import 'package:notes_app/cubits/display_notes_cubit/display_notes_state.dart';
import 'package:notes_app/widgets/add_note_buttom_sheet.dart';
import 'package:notes_app/widgets/no_notes_body.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});
  static const String id = kNotesViewId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "AddNoteButton",
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder: (context) {
              return const AddNoteButtomSheet();
            },
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: BlocBuilder<DisplayNotesCubit, DisplayNotesState>(
        builder: (context, state) {
          if (state is DisplayNotesEmpty) {
            return const NoNotesBody();
          } else {
            return const NotesViewBody();
          }
        },
      ),
    );
  }
}
