import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/display_notes_cubit/display_notes_cubit.dart';
import 'package:notes_app/views/view_note_view.dart';
import 'package:notes_app/models/note_model.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ViewNoteView.id, arguments: note);
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          top: 24,
          bottom: 24,
        ),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                ),
                child: Text(
                  note.subtitle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 18,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          "Confirm Deletion",
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                        content: const Text(
                          "Are you sure you want to delete this item?",
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                color: kPrimaryColor,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(); // Closes the dialog
                            },
                          ),
                          TextButton(
                            child: const Text(
                              "Delete",
                              style: TextStyle(
                                color: kPrimaryColor,
                              ),
                            ),
                            onPressed: () {
                              note.delete();
                              Navigator.of(context).pop(); // Closes the dialog
                              BlocProvider.of<DisplayNotesCubit>(context)
                                  .fetchAllNotes();
                              BlocProvider.of<DisplayNotesCubit>(context)
                                  .foundItems!
                                  .remove(note);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Note was deleted successfuly",
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 25,
                top: 15,
              ),
              child: Text(
                note.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
