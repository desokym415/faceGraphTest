import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nanoid/nanoid.dart';
import 'package:sizer/sizer.dart';
import 'package:thetest/DataBaseHelper.dart';
import 'package:thetest/appClasses/note.dart';
import 'dart:convert';

//import 'package:thetest/appClasses/note.dart';


class add_item extends StatefulWidget {
  @override
  _add_itemState createState() => _add_itemState();
}

class _add_itemState extends State<add_item> {
  DataBaseHelper db = DataBaseHelper();
  //id of the note
  var id = nanoid(4);
  //title var with default val empty
  String title = "";
  //the note image
  File? image;
  //description val
  String description = "";
  // the date and time
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  late String time = now.hour.toString() + ":" + now.minute.toString() + ":" +now.second.toString();
  late String date = formatter.format(now);
  //status
  String dropdownValue = 'Open';
  //visability variables
  bool titleErrorVisibility = false;
  bool descriptionErrorVisibility = false;
  bool imageErrorVisibility = false;

  Future pickImage() async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null)return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    }
    on PlatformException catch(e){
      print("Failed to pick image: $e");
    }
  }
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
                Text("Add Note",
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
              height: 128.h,
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
                            hintText: id.toString(),
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
                      ),),                    SizedBox(width: 5.w,),
                      SizedBox(
                        width: 70.w,
                        height: 6.h,
                        child: TextFormField(
                          onChanged: (val){
                            title = val;
                          },
                          enabled: true,
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
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h,),
                  Visibility(
                    visible: titleErrorVisibility,
                    child: Text("please enter the title", style: TextStyle(
                      color: Colors.red,
                      fontSize: 4.w,
                    ),),
                  ),
                  SizedBox(height: 4.h,),
                  image != null ? Image.file(image !,
                  height: 10.h,
                  width: 10.h,
                  fit: BoxFit.cover,) : FlutterLogo(size: 10.h,),
                  SizedBox(height: 5.h,),
                  Row(
                    children: [
                      SizedBox(width: 5.w,),
                      Text("Picture",style: TextStyle(
                        fontSize: 5.w,
                      ),),
                      SizedBox(width: 15.w,),
                      ElevatedButton(
                        child: const Text('Add from Gallary'),
                        onPressed: () {
                          setState(() {
                            now = DateTime.now();
                            formatter = DateFormat('yyyy-MM-dd');
                            time = now.hour.toString() + ":" + now.minute.toString() + ":" + now.second.toString();
                            date = formatter.format(now);
                          });
                          pickImage();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h,),
                  Visibility(
                    visible: imageErrorVisibility,
                    child: Text("please select an image", style: TextStyle(
                      color: Colors.red,
                      fontSize: 4.w,
                    ),),
                  ),
                  SizedBox(height: 5.h,),
                  Container(
                    height: 30.h,
                    width: 80.w,
                    child: Center(
                      child: TextFormField(
                        onChanged: (val){
                          description = val;
                        },
                        textAlign: TextAlign.center,
                        cursorColor: Colors.grey,
                        maxLength: 300,
                        maxLines: 15,
                        style: TextStyle(
                          fontSize: 6.w,
                        ),
                        decoration: InputDecoration(
                          hintText: "Description",
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
                  SizedBox(height: 1.h,),
                  Visibility(
                    visible: descriptionErrorVisibility,
                    child: Text("please enter the description", style: TextStyle(
                      color: Colors.red,
                      fontSize: 4.w,
                    ),),
                  ),
                  SizedBox(height: 4.h,),
                  Row(
                    children: [
                      SizedBox(width: 10.w,),
                      Column(
                        children: [
                          Text(
                              "       the date:   "+ date ,style: TextStyle(
                            fontSize: 4.w,
                          ),
                          ),
                          SizedBox(height: 2.h,),
                          Text(
                            "the time:  " + time ,style: TextStyle(
                            fontSize: 4.w,
                          ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5.w,),
                      ElevatedButton(
                        child: const Text('Update time'),
                        onPressed: () {
                          setState(() {
                            now = DateTime.now();
                            formatter = DateFormat('yyyy-MM-dd');
                            time = now.hour.toString() + ":" + now.minute.toString() + ":" + now.second.toString();
                            date = formatter.format(now);
                          });
                          print(formatter.format(now));
                        },
                      ),
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
                            //borderRadius: BorderRadius.circular(5.w),
                            style: const TextStyle(color: const Color.fromRGBO(112, 116, 162, 1),
                                fontFamily: "theFont"),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
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
                  SizedBox(height: 6.h),
                  SizedBox(
                    width: 50.w,
                    height: 7.h,
                    child: ElevatedButton(
                      child: Text('Save',style: TextStyle(
                        fontSize: 7.w,
                      ),),
                      onPressed: () async {
                        String base64Image = "";
                        if(image != null)
                          {
                            final bytes = File(image!.path).readAsBytesSync();
                            //the image converted to string
                            base64Image =  base64Encode(bytes);
                            setState(() {
                              imageErrorVisibility = false;
                            });
                          }
                        else {
                          imageErrorVisibility = true;
                        }
                        setState(() {
                          if(title == ""){
                              titleErrorVisibility = true;}
                          else {
                            titleErrorVisibility = false;
                          }
                          if (description == ""){
                              descriptionErrorVisibility = true;
                          }
                          else {
                            descriptionErrorVisibility = false;
                          }
                        });
                        if(image != null && description != "" && title != ""){
                        visualNote theNote = visualNote(id, title, base64Image, description, date, time, dropdownValue);
                        db.insertNote(theNote);
                        Navigator.pop(context);}
                      },
                    ),
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

