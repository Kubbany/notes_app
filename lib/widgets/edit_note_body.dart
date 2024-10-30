import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/display_notes_cubit/display_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    String? title, subtitle;
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(
            title: "Edit Note",
            heroTag: "SaveButton",
            icon: Icons.check,
            onPressed: () {
              note.title = title ?? note.title;
              note.subtitle = subtitle ?? note.subtitle;
              note.save();
              BlocProvider.of<DisplayNotesCubit>(context).fetchAllNotes();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Note was edited successfuly"),
                ),
              );
              Navigator.pop(context);
            },
          ),
          CustomTextFormField(
            onChanged: (value) {
              title = value;
            },
            hintText: note.title,
          ),
          CustomTextFormField(
            onChanged: (value) {
              subtitle = value;
            },
            hintText: note.subtitle,
            maxLines: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          EditNoteColorsListView(
            note: note,
          ),
        ],
      ),
    );
  }
}
