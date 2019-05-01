import 'package:flutter/material.dart';

class NotesDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NotesDetailsState();
  }

}

class NotesDetailsState extends State<NotesDetails> {

  var _priority = ['High','Low'];
  var currentPriority = "Low";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "Edit Notes"
        ),
      ),
      body: Container(
      padding: EdgeInsets.all(20.0),
      child: ListView(
        children: <Widget>[
          DropdownButton<String>(
            value: currentPriority,
            items: _priority.map((String selectedPriority) {
              return DropdownMenuItem<String>(
                value: selectedPriority,
                child: Text(
                  selectedPriority
                ),
              );
            }).toList(),
            onChanged: (String selectedValue) {
              setState(() {
                currentPriority = selectedValue;
              });
            },
          ),

          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: TextField(
            decoration: InputDecoration(
              hintText: "Enter the title:",
              labelText: "Title",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
              )
            ),
          ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: TextField(
            decoration: InputDecoration(
              hintText: "Enter the description:",
              labelText: "Description",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
              )
            ),
          ),
          ),

          Padding(
            padding: EdgeInsets.only(
              top: 20.0
            ),
            child: Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  color: Colors.orange,
                  child: Text(
                    "Save"
                  ),
                  onPressed: () {

                  },
                ),
              ),

              Container(width: 5.0,),

              Expanded(
                child: RaisedButton(
                  color: Colors.red,
                  child: Text(
                    "Delete"
                  ),
                  onPressed: () {
                    
                  },
                ),
              )
            ],
          ),
          )
        ],
      ),
    ),
      );
  }

}