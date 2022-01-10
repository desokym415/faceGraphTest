import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:thetest/DataBaseHelper.dart';
import 'package:thetest/statefull/add_item.dart';
import 'package:thetest/statefull/allvisualnotes.dart';
import 'dart:convert';

class Home extends StatelessWidget {
  //all visualNotes
  DataBaseHelper db = DataBaseHelper();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: SizedBox(
              height: 100.h,
              child: Column(
                children: [
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      SizedBox(width: 35.w,),
                      Text("Hello",
                        style: TextStyle(
                          color: const Color.fromRGBO(1, 18, 112, 1),
                          fontFamily: "theFont",
                          fontSize: 9.w,
                        ),),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      SizedBox(width: 25.w,),
                      GestureDetector(
                        onTap: () async {
                          List notes = await db.viewAllNotes();
                          List titels = await db.viewAllTitles();
                          List ids = await db.viewAllIds();
                          for (var i = 0; i < notes.length; i++) {
                            // TO DO
                            var currentElement = notes[i];
                            Image x = Image.memory(base64Decode(currentElement));
                            notes[i] = x;
                          }
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => viewAll(notes, titels, ids)),
                          );
                        },
                        child: Container(
                          width: 50.w,
                          height: 8.h,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(105, 203, 248, 1),
                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          ),
                          child: Text("View all",style: TextStyle(
                            fontSize: 6.5.w,
                            color: Colors.white,
                            fontFamily: "theFont",
                          ),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      SizedBox(width: 25.w,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => add_item()),
                          );
                          },
                        child: Container(
                          width: 50.w,
                          height: 8.h,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(105, 203, 248, 1),
                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          ),
                          child: Text("Add item",style: TextStyle(
                            fontSize: 6.5.w,
                            color: Colors.white,
                            fontFamily: "theFont",
                          ),),
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

