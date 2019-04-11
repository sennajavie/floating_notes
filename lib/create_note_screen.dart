import 'package:floating_notes/note.dart';
import 'package:flutter/material.dart';


class CreateNoteScreen extends StatefulWidget {
  static const routeName = '/createNote';

  String title = "";
  String text = "";

  @override
  State<StatefulWidget> createState() => _CreateNoteScreenState();
}


class _CreateNoteScreenState extends State<CreateNoteScreen> {

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async {
          Note note = Note(widget.title, widget.text);
          Navigator.pop(context, {"note" : note.toMap()});
          return false;
        },
        child: Scaffold(
            appBar: AppBar(
              title: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Note title"
                ),
                onChanged: (text) {
                  widget.title = text;
                },
              ),
            ),
            body: Container(
              color: Colors.transparent,
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Note text"
                ),
                onChanged: (text) {
                  widget.text = text;
                },
              ),
            )));
  }
}
