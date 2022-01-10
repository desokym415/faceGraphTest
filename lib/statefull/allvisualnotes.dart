import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:thetest/DataBaseHelper.dart';
import 'package:thetest/statefull/delete_edit.dart';


class viewAll extends StatefulWidget {
  List allNotes = [];
  List allTitels = [];
  List allIds = [];
  viewAll(this.allNotes, this.allTitels, this.allIds);

  @override
  _viewAllState createState() => _viewAllState();
}

class _viewAllState extends State<viewAll> {
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
                Text("All visual notes",
                  style: TextStyle(
                      fontSize: 8.w,
                      color: Colors.black
                  ),),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 2.h,),
                  Text("to edit or delete any note press on its title", style: TextStyle(
                    color: Colors.red,
                    fontSize: 4.w,
                  ),),
                  SizedBox(height: 2.h,),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                          itemCount: widget.allNotes.length,
                          itemBuilder: (context, index){
                            return ListTile(
                              leading: widget.allNotes[index],
                              title: Text(widget.allTitels[index], style: TextStyle(
                                fontSize: 10.w,
                              ),),
                              subtitle: Text("id :" + widget.allIds[index]),
                              onTap: () async {
                                List theNote  = await db.viewById(widget.allIds[index]);
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => delete_edit(theNote, widget.allNotes[index])),
                                );
                              },
                            );
                          }),
                ],
              ),
          ),
        );
      },
    );
  }
}
