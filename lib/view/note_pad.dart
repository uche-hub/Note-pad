import 'package:flutter/material.dart';
import 'package:note_pad/entity/note_entity.dart';
import 'package:note_pad/view/notes.dart';

class MyNote extends StatefulWidget {
  @override
  _MyNoteState createState() => _MyNoteState();
}


class _MyNoteState extends State<MyNote> {

  List<NotesTable> list = [
    NotesTable(
      'Notes from UI event',
      'Lorem ipsum dolor sit amet, conseletur sadpacing...',
      'Oct 25, 2019, 10:25',
    ),
    NotesTable(
      'Material Design',
      'Material Design is a design language that Google developed in 2014. Expanding..',
      'Oct 25, 2019, 9:25',
    ),
    NotesTable(
      'Meeting 20/10',
      'Lorem ipsum dolor sit amet, conseletur sadpacing...',
      'Oct 25, 2019, 10:25',
    ),
  ];

  @override
  Widget build(BuildContext context) {

    _listItem(ctx, index) {
      return Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => Notes()
              ));
            },
            title: Text(
              list[index].noteTitle,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor,
              ),
            ),
            subtitle: Text(
              list[index].noteDesc,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).accentColor,
              ),
            ),
            trailing: Container(
              width: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      Icon(
                        Icons.more_vert,
                      ),
                    ],
                  ),
                  Text(
                    '${list[index].currentDate}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(
            color: Theme.of(context).accentColor,
          ),
        ],
      );
    }


    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 50, left: 150, bottom: 20),
              child: Row(
                children: <Widget>[
                  Text(
                    "MyNotes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color(0xff111D49)
                    ),
                  ),
                  SizedBox(width: 90,),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(
                        Icons.search,
                        color: Color(0xff111D49),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                  itemBuilder: (context, index) => _listItem(context, index),
                scrollDirection: Axis.vertical,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff111D49),
        child: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => Notes()
            ));
          },
          icon: Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
    );
  }
}
