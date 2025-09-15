import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:sec13/models/palce.dart';
import 'package:path_provider/path_provider.dart' as sypath;
// import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

// Future<Database> getDatabase() async {
//   final dbPath = await sql.getDatabasesPath();
//   final db = await sql.openDatabase(path.join(dbPath, 'places.dp'),
//       onCreate: (db, version) {
//     return db.execute(
//         'CREATE TABLE user_places (id TEXT PRIMARY KEY, title TEXT,image TEXT )');
//   }, version: 1);
//   return db;
// }
Future<Database> getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(join(dbPath, 'places.db'), // Ensure `join` is used here
      onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE user_places (id TEXT PRIMARY KEY, title TEXT, image TEXT)');
  }, version: 1);
  return db;
}


class ListNotifier extends StateNotifier<List<Place>> {
  ListNotifier() : super([]);

  // get path => path;

  Future<void> leadDatabase() async {
    final db = await getDatabase();
    final data = await db.query('user_places');
    final palces = data
        .map((row) => Place(
            id: row['id'] as String,
            title: row['title'] as String,
            image: File(row['image'] as String)))
        .toList();
        state = palces;
  }

  void addPlace(String title, File image) async {
    final appDir = await sypath.getApplicationDocumentsDirectory();
    final fileName = basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$fileName');
    final item = Place(title: title, image: copiedImage);

    // getDatabase();
    final db = await getDatabase();
    db.insert('user_places',
        {'id': item.id, 'title': item.title, 'image': item.image.path});
    state = [item, ...state];
  }

  // void removePlace(String item) {
  //   state = [...state-item]
  // }
  void removePlace(Place item) {
    state = state.where((place) => place != item).toList();
  }
}

var availablePlaces =
    StateNotifierProvider<ListNotifier, List<Place>>((ref) => ListNotifier());
