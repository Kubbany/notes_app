import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/views/notes_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "Poppins",
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: NotesView.id,
      routes: {
        NotesView.id: (context) => const NotesView(),
      },
    );
  }
}
