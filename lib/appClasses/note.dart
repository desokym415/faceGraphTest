class visualNote{
  String id = "";
  String title = "" ;
  String image = "";
  String description = "";
  String date = "";
  String time = "";
  String status = 'Open';
  visualNote(this.id ,this.title , this.image ,this.description, this.date, this.time, this.status);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'description': description,
      'date' : date,
      'time' : time,
      'status' : status
    };
  }

  visualNote.fromMap(Map<String , dynamic> map){
    id = map['id'] ;
    title = map['title'] ;
    image = map['image']  ;
    description  = map['description'] ;
    date  = map['date'] ;
    time  = map['time'] ;
    status  = map['status'] ;
  }
  @override
  String toString() {
    return 'Note{NoteId: $id, NoteTitle: $title, NoteImage: $image, description: $description, NoteDate: $date, NoteTime: $time, NoteStatus: $status}';
  }
}