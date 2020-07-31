import 'package:floor/floor.dart';

@entity
class NotesTable {
  @PrimaryKey(autoGenerate: true)
  final int id = 0;
  final String noteTitle;
  final String noteDesc;
  final String currentDate;

  NotesTable(this.noteTitle, this.noteDesc, this.currentDate);
}