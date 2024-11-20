import 'package:flutter_application_1/database/database_helper.dart';
import 'package:flutter_application_1/models/user_model.dart';

class UserDao {
  final database = DatabaseHelper.instance.db;

  Future<List<UserModel>> readAll() async {
    final db = await database;
    final data = await db.query('userdetails');
    return data.map((e) => UserModel.fromMap(e)).toList();
  }

  Future<int> insert(UserModel user) async {
    final db = await database;
    return await db.insert('userdetails', user.toMap());
  }

  Future<void> update(UserModel user) async {
    final db = await database;
    await db.update('userdetails', user.toMap(),
        where: 'id = ?', whereArgs: [user.id]);
  }

  Future<void> delete(UserModel user) async {
    final db = await database;
    await db.delete('userdetails', where: 'id = ?', whereArgs: [user.id]);
  }
}
