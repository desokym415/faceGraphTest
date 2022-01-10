import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:thetest/DataBaseHelper.dart';
import 'package:thetest/appClasses/note.dart';

class edit extends StatefulWidget {
  List theNote = [];
  Widget image ;
  edit(this.theNote, this.image);
  @override
  _editState createState() => _editState();
}

class _editState extends State<edit> {
  DataBaseHelper db = DataBaseHelper();
  String title = "";
  //description val
  String description = "";
  //status
  String dropdownValue = 'Open';
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: const Color.fromRGBO(239, 245, 255, 1),
            leading: IconButton(
              color: Colors.black,
              icon: const Icon(Icons.arrow_back,),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            title: Row(
              children: [
                SizedBox(width: 12.w,),
                Text("Edit Note",
                  style: TextStyle(
                      fontSize: 8.w,
                      color: Colors.black
                  ),),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: SizedBox(
              height: 120.h,
              child: Column(
                children: [
                  SizedBox(height: 4.h,),
                  Row(
                    children: [
                      SizedBox(width: 5.w,),
                      Text("ID",style: TextStyle(
                        fontSize: 5.w,
                      ),),
                      SizedBox(width: 10.w,),
                      SizedBox(
                        width: 30.w,
                        height: 6.h,
                        child: TextFormField(
                          enabled: false,
                          style: TextStyle(
                            fontSize: 7.w,
                            color: Colors.black,
                          ),
                          cursorColor: const Color.fromRGBO(3, 141, 151, 1),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(1.w),
                            fillColor:  const Color.fromRGBO(219, 232, 255, 1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintText: widget.theNote[0].toString(),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      Text("Unchangeable",style: TextStyle(
                        fontSize: 5.w,
                        color: Colors.red,
                      ),),
                    ],
                  ),
                  SizedBox(height: 4.h,),
                  Row(
                    children: [
                      SizedBox(width: 5.w,),
                      Text("Title",style: TextStyle(
                        fontSize: 5.w,
                      ),),
                      SizedBox(width: 5.w,),
                      SizedBox(
                        width: 70.w,
                        height: 6.h,
                        child: TextFormField(
                          onChanged: (val){
                            title = val;
                          },
                          initialValue:  widget.theNote[1],
                          enabled: true,
                          style: TextStyle(
                            fontSize: 7.w,
                            color: Colors.black,
                          ),
                          cursorColor: const Color.fromRGBO(3, 141, 151, 1),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(1.w),
                            fillColor:  const Color.fromRGBO(219, 232, 255, 1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    children: [
                      SizedBox(width: 5.w,),
                      Text("the Picture :",style: TextStyle(
                        fontSize: 5.w,
                      ),),
                      SizedBox(width: 15.w,),
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  SizedBox(
                      height: 15.h,
                      width: 15.h,
                      child: widget.image),
                  SizedBox(height: 5.h,),
                  Container(
                    height: 30.h,
                    width: 80.w,
                    child: Center(
                      child: TextFormField(
                        onChanged: (val){
                          description = val;
                          if(description == ""){
                            description = widget.theNote[3];
                          }
                        },
                        initialValue: widget.theNote[3],
                        enabled: true,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.grey,
                        maxLength: 300,
                        maxLines: 15,
                        style: TextStyle(
                          fontSize: 6.w,
                        ),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 5.w,
                            fontFamily: 'theFont',
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      color: const Color.fromRGBO(219, 232, 255, 1),
                      border: Border.all(
                        color: const Color.fromRGBO(196, 205, 223, 1),
                        width: 5,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    children: [
                      SizedBox(width: 10.w,),
                      Column(
                        children: [
                          Text(
                            "       the date:   "+ widget.theNote[4] ,style: TextStyle(
                            fontSize: 4.w,
                          ),
                          ),
                          SizedBox(height: 2.h,),
                          Text(
                            "the time:  " + widget.theNote[5] ,style: TextStyle(
                            fontSize: 4.w,
                          ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5.w,),
                    ],
                  ),
                  SizedBox(height: 6.h,),
                  Row(
                    children: [
                      SizedBox(width: 5.w,),
                      Text("Status",style: TextStyle(
                        fontSize: 7.w,
                      ),),
                      SizedBox(width: 15.w,),
                      Container(
                        height: 5.5.h,
                        width: 50.w,
                        //alignment: Alignment.centerLeft,
                        padding: EdgeInsets.fromLTRB(2.w, 0.0, 2.w, 0.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(3.w)),
                          border: Border.all(
                            width: .5.w,
                            color: const Color.fromRGBO(112, 116, 162, 1),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            style: const TextStyle(color: Color.fromRGBO(112, 116, 162, 1),
                                fontFamily: "theFont"),
                            onChanged: (String? val){
                              setState(() {
                                dropdownValue = val!;
                              });
                            },
                            items: <String>['Open', 'Closed']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.h),
                  Row(
                    children: [
                      SizedBox(width: 12.w,),
                      SizedBox(
                        width: 30.w,
                        height: 5.5.h,
                        child: ElevatedButton(
                          child: Text('Edit',style: TextStyle(
                            fontSize: 7.w,
                          ),),
                          onPressed: () async {
                            //to edit visual note we delete the old then add another note
                            if(title == ""){
                              title = widget.theNote[1];
                            }
                            if(description == ""){
                              description = widget.theNote[3];
                            }
                            if(title != widget.theNote[1] || description != widget.theNote[3] || dropdownValue != widget.theNote[6]){
                              visualNote theEditedNote = visualNote(widget.theNote[0], title, widget.theNote[2], description, widget.theNote[4], widget.theNote[5], dropdownValue);
                              db.deleteNote(widget.theNote[0]);
                              db.insertNote(theEditedNote);
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            }
                            else{

                            }
                          },
                        ),
                      ),
                      SizedBox(width: 15.w,),
                      SizedBox(
                        width: 30.w,
                        height: 5.5.h,
                        child: ElevatedButton(
                          child: Text('back',style: TextStyle(
                            fontSize: 7.w,
                          ),),
                          onPressed: () async {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
