import 'package:sqflite/sqflite.dart';

final tableName = 'users';

class User {
  int id;
  String name;
  String username;

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'name': name,
      'username': username
      };
      if (id =! null) {
        map['id'] = id;
      }
      return map;
  }

  User.fromMap(Map<String, dynamic> map){
    name = map['name'];
    username = map['username'];
  }
  
}


class UserProvider {
  Database db;

  Future<User> getUser(int id) async {
    List<Map> maps = await db.query(tableName,
        columns: ['id', 'name', 'username'],
        where: '$id = ?',
        whereArgs: [id]);
        if (maps.length > 0) {
          return User.fromMap(maps.first);
        }
    return null;
  }

  Future<List<User>> getAll(int id) async {
    List<Map> maps = await db.query(tableName,
        columns: ['id', 'name', 'username']);
        if (maps.length > 0) {
          return maps.map((map) => User.fromMap(map));
        }
    return null;
  }
}