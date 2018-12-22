import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String TABLE_USER = "CREATE TABLE users(id INTEGER AUTO_INCREMENT PRIMARY KEY, username VARCHAR(30) UNIQUE, name VARCHAR)";
const String TABLE_TWITTE = "CREATE TABLE twittes(id INTEGER AUTO_INCREMENT PRIMARY KEY, content VARCHAR, user VARCHAR, FOREIGN KEY(user) REFERENCES user(username))";


class DatabaseInstance {

  static Future<Database> initDB() async {
    String path;
    Future<Database> database;
    await getDatabasesPath().then((String databasePath){
        path = join(databasePath, 'twitter.db');
    });

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }
  
  static _onCreate(Database db, version) async {
        db.execute(TABLE_USER).then((res){
          db.execute('CREATE UNIQUE INDEX username_index ON users(username').then((res){
            db.execute(TABLE_TWITTE).then((res){
              db.transaction((createUsers){
                createUsers.rawInsert("INSERT INTO users(username, name) VALUES('brunodarshan', 'Darshan')");
                createUsers.rawInsert("INSERT INTO users(username, name) VALUES('jane_due_28', 'Jaaaane! :V')");
                createUsers.rawInsert("INSERT INTO users(username, name) VALUES('anonymou123', 'Mistery Dev')");
              });
              db.transaction((createTwittes){
                createTwittes.rawInsert("INSERT INTO twittes(content, user) VALUES('Feliz Natal seu fela!', 'brunodarshan')");
                createTwittes.rawInsert("INSERT INTO twittes(content, user) VALUES('Foda-se, @brunodarshan', 'jane_due_28')");
                createTwittes.rawInsert("INSERT INTO twittes(content, user) VALUES('Eita, jovens! @brunodarshan @jane_due_28', 'anonymou123')");
              });
            });
          });
        });
  }

}
  