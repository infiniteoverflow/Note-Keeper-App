class Note {
  int _id,_priority;
  String _title,description,_date;

  Note(this._title,this._priority,this._date,{this.description});

  Note.withId(this._id,this._title,this._priority,this._date,{this.description});

  int get id=> _id;
  int get priority => _priority;
  String get title => _title;
  String get _description => description;
  String get date => _date;

  set title(String newTitle) {
    this._title = newTitle;
  }
  set descr(String newDescription) {
    this.description = newDescription;
  }
  set date(String newDate) {
    this._date = newDate;
  }

  set id(int id) {
    this._id = id;
  }
  set priority(int priority) {
    this._priority = priority;
  }

  Map<String,dynamic> toMap() {
    var map = Map<String,dynamic>();
    if(_id!=null)
      map['id'] = _id;
    map['title'] = _title;
    map['date'] = _date;
    map['description'] = description;
    map['priority'] = _priority;

    return map;
  }

  Note.fromMapObject(Map<String,dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this.description = map['description'];
    this._date = map['date'];
    this._priority = map['priority'];
  }
}