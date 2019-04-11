import 'package:floating_notes/create_note_screen.dart';
import 'package:floating_notes/note_screen.dart';
import 'package:floating_notes/note.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  NotesScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  final _notes = List<Note>();

  void _openNote(Note note) {
    Navigator.pushNamed(context, NoteScreen.routeName, arguments: note);
  }

  void _addNote() async {
     Map results = await Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
       return CreateNoteScreen();
     }));
     if(results != null && results.containsKey("note")) {
       Note note = Note.fromMap(results["note"]);
       _notes.add(note);
     }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildNotesList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        tooltip: 'Add note',
        child: Icon(Icons.add),
      )
    );
  }

  Widget _buildNotesList() {
    return new ListView.builder(
      padding: const EdgeInsets.all(5.0),
      itemCount: _notes.length,
      itemBuilder: (context, i) {
        return _buildNoteRow(_notes[i]);
      },
    );
  }

  Widget _buildNoteRow(Note note) {
    return new ListTile(
      title: new Text(note.text),
      onTap: () {
        _openNote(note);
      },
    );
  }
}
