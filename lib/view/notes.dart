import 'package:flutter/material.dart';
import 'package:note_pad/entity/note_entity.dart';
import 'package:note_pad/noteDao/note_dao.dart';
import 'package:note_pad/noteDatabase/database.dart';
import 'package:note_pad/view/note_pad.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}


class _NotesState extends State<Notes> {

  var _categoryTitleController = TextEditingController();
  var _categoryDescriptionController = TextEditingController();

  @override
  void initState() {
    setDatabase();
    super.initState();
  }

   NotesDao notesDao;

  setDatabase() async{

    final database = await $FloorAppDatabase.databaseBuilder('note_database.db').build();
    notesDao = database.personDao;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 50, left: 30, bottom: 20),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MyNote()
                        ));
                      },
                      icon: Icon(
                        Icons.chevron_left,
                        color: Color(0xff111D49),
                      ),
                    ),
                  ),
                  SizedBox(width: 180,),
                  FlatButton(
                    onPressed: () async{
                      if(_categoryTitleController.text.isNotEmpty && _categoryDescriptionController.text.isNotEmpty){
                        NotesTable notesTable = NotesTable(
                          _categoryTitleController.text,
                          _categoryDescriptionController.text,
                          DateTime.now().toString(),
                        );
                        await notesDao.insertPerson(notesTable);

                        /// check console log to see output
                        print(notesTable);
                      }else{
                        /// check console log to see output
                        print("Failed");
                      }
                    },
                    child: Text(
                      "Save Note",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff111D49)
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 32,),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
                ),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _categoryTitleController,
                      decoration: InputDecoration(
                          hintText: "Title",
                        filled: true,
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.white,
                        child: TextField(
                          controller: _categoryDescriptionController,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: "Description",
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                        ),
                    ),
                      )
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
