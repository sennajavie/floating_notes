import 'package:floating_notes/note.dart';
import 'package:flutter/material.dart';

class NoteScreen extends StatelessWidget {
  static const routeName = '/note';

  @override
  Widget build(BuildContext context) {
    final Note note = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(note.title),
        ),
        body: Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(20),
            child: Text(note.text),
            ));
  }
}
