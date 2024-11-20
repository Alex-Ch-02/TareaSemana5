import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get db async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'usersDatabaseCompu.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
  CREATE TABLE userdetails (
    id INTEGER PRIMARY KEY,
    procesador TEXT NOT NULL,
    discoduro TEXT NOT NULL,
    ram TEXT NOT NULL
  )
  ''');
  }

  Future<void> insertUser(
      int id, String procesador, String discoduro, String ram) async {
    final db = await instance.db;
    await db.insert(
      'userdetails',
      {
        'id': id, // Ahora debes especificar el id manualmente
        'procesador': procesador,
        'discoduro': discoduro,
        'ram': ram,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
