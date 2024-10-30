import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/display_notes_cubit/display_notes_cubit.dart';
import 'package:notes_app/cubits/display_notes_cubit/display_notes_state.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_card.dart';

class SearchNotesView extends StatelessWidget {
  const SearchNotesView({super.key});
  static const String id = kSearchNotesId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            BlocProvider.of<DisplayNotesCubit>(context).searchNote(value);
            if (value == "") {
              BlocProvider.of<DisplayNotesCubit>(context).foundItems = [];
            }
          },
          decoration: const InputDecoration(
            hintText: "Search Note",
          ),
        ),
      ),
      body: BlocBuilder<DisplayNotesCubit, DisplayNotesState>(
        builder: (context, state) {
          List<NoteModel> foundItems =
              BlocProvider.of<DisplayNotesCubit>(context).foundItems ?? [];
          if (state is DisplayNotesSuccess) {
            return Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 15,
              ),
              child: ListView.builder(
                itemCount: foundItems.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: NoteCard(
                    note: foundItems[index],
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
