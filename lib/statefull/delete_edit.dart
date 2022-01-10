import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:thetest/DataBaseHelper.dart';
import 'package:thetest/statefull/edit.dart';

class delete_edit extends StatefulWidget {
  List theNote = [];
  Widget image ;
  delete_edit(this.theNote, this.image);
  @override
  _delete_editState createState() => _delete_editState();
}

class _delete_editState extends State<delete_edit> {
  DataBaseHelper db = DataBaseHelper();
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
                Text("Delete and Edit Note",
                  style: TextStyle(
                      fontSize: 5.w,
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
                          enabled: false,
                          style: TextStyle(
                            fontSize: 7.w,
                            color: Colors.black,
                          ),
                          cursorColor: const Color.fromRGBO(3, 141, 151, 1),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(1.w),
                            //isDense: true,
                            fillColor:  const Color.fromRGBO(219, 232, 255, 1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintText: widget.theNote[1],
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
                        enabled: false,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.grey,
                        maxLength: 300,
                        maxLines: 15,
                        style: TextStyle(
                          fontSize: 6.w,
                        ),
                        decoration: InputDecoration(
                          hintText: widget.theNote[3],
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
                            value: widget.theNote[6],
                            //borderRadius: BorderRadius.circular(5.w),
                            style: const TextStyle(color: const Color.fromRGBO(112, 116, 162, 1),
                                fontFamily: "theFont"),
                            onChanged: null,
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
                          child: Text('Delete',style: TextStyle(
                            fontSize: 7.w,
                          ),),
                          onPressed: () async {
                            showAlertDialog(context);
                          },
                        ),
                      ),
                      SizedBox(width: 15.w,),
                      SizedBox(
                        width: 30.w,
                        height: 5.5.h,
                        child: ElevatedButton(
                          child: Text('Edit',style: TextStyle(
                            fontSize: 7.w,
                          ),),
                          onPressed: () async {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => edit(widget.theNote, widget.image)),
                            );
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
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Yes", style: TextStyle(
        fontSize: 5.w,
      ),),
      onPressed:  () {
        db.deleteNote(widget.theNote[0]);
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("No", style: TextStyle(
        fontSize: 5.w,
      ),),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Warning", style: TextStyle(
        color: Colors.red,
        fontSize: 7.w,
      ),),
      content: Text("Are you sure you want to delete this visual note?", style: TextStyle(
        fontSize: 4.w,
      ),),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

