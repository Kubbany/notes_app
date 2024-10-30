import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/display_notes_cubit/display_notes_state.dart';
import 'package:notes_app/models/note_model.dart';

class DisplayNotesCubit extends Cubit<DisplayNotesState> {
  DisplayNotesCubit() : super(DisplayNotesInitial());

  List<NoteModel>? notes;
  List<NoteModel>? foundItems;
  fetchAllNotes() async {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    if (notesBox.isEmpty) {
      emit(DisplayNotesEmpty());
    } else {
      emit(DisplayNotesSuccess());
    }
  }

  searchNote(String title) {
    emit(DisplayNotesInitial());
    foundItems = [];
    bool flag = false;
    if (notes?.isEmpty ?? true) {
    } else {
      for (int i = 0; i < notes!.length; i++) {
        if (notes![i].title.toLowerCase().contains(title.toLowerCase())) {
          flag = true;
          foundItems!.add(notes![i]);
        }
      }
      if (flag) {
        emit(DisplayNotesSuccess());
      } else {
        emit(DisplayNotFound());
      }
    }
  }
}
