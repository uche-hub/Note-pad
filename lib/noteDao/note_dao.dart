import 'package:floor/floor.dart';
import 'package:note_pad/entity/note_entity.dart';

@dao
abstract class NotesDao {
  @Query('SELECT * FROM Person')
  Future<List<NotesTable>> findAllPersons();

  @insert
  Future<void> insertPerson(NotesTable notes);
}