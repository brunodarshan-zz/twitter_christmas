import 'package:sqflite/sqflite.dart';

final String tableName = "twittes";
class Twitte {
    int id;
    String content;
    String user;

    Map<String, dynamic> toMap(){
      var map = <String, dynamic>{
        'content': content,
        'user': user
      };
      if (id != null){
        map["id"] = id;
      }
      return map;
    }

    Twitte.fromMap(Map<String, dynamic> map){
      content = map['content'];
      user = map['user'];
    }
}

class TwitteProvider {
  Database db;

  Future<Twitte> insert(Twitte twt) async {
    db.insert(tableName, twt.toMap()).then((onValue){
      return twt;
    });
  }

  Future<List<Twitte>> getAll(int id) async {
    List<Map> maps = await db.query(tableName,
        columns: ['id', 'content', 'user']);
        if (maps.length > 0) {
          return maps.map((map) => Twitte.fromMap(map));
        }
    return null;
  }

  
  Future<Twitte> getTodo(int id) async {
    List<Map> maps = await db.query(tableName,
        columns: ['id', 'content', 'user'],
        where: '$id = ?',
        whereArgs: [id]);
        if (maps.length > 0) {
          return Twitte.fromMap(maps.first);
        }
    return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Twitte twt) async {
    return await db.update(tableName, twt.toMap(),
        where: 'id = ?', whereArgs: [twt.id]);
  }

  Future close() async => db.close();
}