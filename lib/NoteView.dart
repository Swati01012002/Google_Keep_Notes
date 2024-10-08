import 'package:flutter/material.dart';
import 'package:google_keep_notes/EditNoteView.dart';
import 'package:google_keep_notes/Colors.dart';
import 'package:google_keep_notes/Home.dart';
import 'package:google_keep_notes/model/MyNoteModel.dart';
import 'package:google_keep_notes/services/db.dart';

// ignore: must_be_immutable
class NoteView extends StatefulWidget {
  Note note;
  NoteView({required this.note});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        backgroundColor: bgColor,
        elevation: 0.0,
        actions: [
          IconButton(
            splashRadius: 17,
            onPressed: () async {
              await NotesDatabase.instance.pinNote(widget.note);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            icon: Icon(
                widget.note.pin ? Icons.push_pin : Icons.push_pin_outlined),
          ),
          /*IconButton(
            splashRadius: 17,
            onPressed: () async {
              await NotesDatabase.instance.archNote(widget.note);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            icon: Icon(widget.note.isArchived
                ? Icons.archive
                : Icons.archive_outlined),
          ),*/
          IconButton(
            splashRadius: 17,
            onPressed: () async {
              await NotesDatabase.instance.deleteNote(widget.note);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            icon: Icon(Icons.delete_forever_outlined),
          ),
          IconButton(
            splashRadius: 17,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditNoteView(note: widget.note)));
            },
            icon: Icon(Icons.edit_outlined),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.note.title,
              style: TextStyle(
                  color: white, fontSize: 23, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.note.content,
              style: TextStyle(color: white),
            )
          ],
        ),
      ),
    );
  }
}
