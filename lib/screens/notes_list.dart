import "package:flutter/material.dart";
import 'package:notekeeper/screens/notes_details.dart';


class NotesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NotesListState();
  }

}

class NotesListState extends State<NotesList> {

  var count = 1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes List"
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return NotesDetails("Add Note");
          }));
        },
      ),
      body: getList(),
    );
  }

  ListView getList() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context , int position) {
        return Card(
          color: Colors.white,
          elevation: 5.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.keyboard_arrow_right),
            ),
            title: Text(
              "Meet Teacher"
            ),
            subtitle: Text(
              "Have to submit assignment"
            ),
            trailing: Icon(Icons.delete),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NotesDetails("Edit Note");
              }));
            },
          ),
        );
      },
    );
  }

}
