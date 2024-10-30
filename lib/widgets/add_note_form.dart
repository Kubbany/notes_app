import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? title, subtitle;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            onSaved: (value) {
              title = value;
            },
            hintText: "Title",
          ),
          CustomTextFormField(
            onSaved: (value) {
              subtitle = value;
            },
            hintText: "Content",
            maxLines: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          const ColorsListView(),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var currentDate = DateTime.now();
                var formattedCurrentDate =
                    DateFormat("dd-MM-yyyy").format(currentDate);
                NoteModel note = NoteModel(
                  title: title!,
                  subtitle: subtitle!,
                  date: formattedCurrentDate,
                  color: BlocProvider.of<AddNoteCubit>(context).color?.value ??
                      const Color(0xffF79256).value,
                );
                BlocProvider.of<AddNoteCubit>(context).addNote(note);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Note was added successfuly"),
                  ),
                );
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
