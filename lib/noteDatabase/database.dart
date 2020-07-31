import 'dart:async';
import 'package:floor/floor.dart';
import 'package:note_pad/entity/note_entity.dart';
import 'package:note_pad/noteDao/note_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [NotesTable])
abstract class AppDatabase extends FloorDatabase {
  NotesDao get personDao;
}