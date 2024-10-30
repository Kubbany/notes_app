import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color? color;
  addNote(NoteModel note) async {
    note.color = color?.value ?? const Color(0xffF79256).value;
    emit(AddNoteLoading());
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    await notesBox.add(note);
    emit(AddNoteSuccess());
  }
}
