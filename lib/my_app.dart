import 'package:floating_notes/create_note_screen.dart';
import 'package:floating_notes/note_screen.dart';
import 'package:floating_notes/notes_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floating Notes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotesScreen(title: 'Notes'),
      routes: {
        NoteScreen.routeName: (context) => NoteScreen(),
        CreateNoteScreen.routeName: (context) => CreateNoteScreen()
      },
    );
  }
}