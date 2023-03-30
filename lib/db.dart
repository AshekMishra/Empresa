import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class regDatabase  {
  static final regDatabase instance = regDatabase._init();
  static Database? _database;
  regDatabase._init();

  Future<Database?> get database async{
    if(_database != null) return _database;
    _database = await _initializeDB('reg.db');
    return _database;
  }


  Future<Database> _initializeDB(String filepath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath , filepath);

    return await openDatabase(path , version:  1, onCreate: _createDB );
  }


  Future _createDB(Database db, int version) async{
    await db.execute('''
    CREATE TABLE reg(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      day INTEGER NOT NULL,
      month INTEGER NOT NULL,
      year INTEGER NOT NULL,
      sale INTEGER NOT NULL,
      expense INTEGER NOT NULL
    )
    ''');
  }

  Future<bool?> insertReg(int day,int month,int year,int sale,int expense) async{
    final db = await instance.database;
    await db!.insert("reg", {"day": day, "month": month, "year":year,"sale": sale,"expense":expense});
    return true;
  }

  Future<List<Map<String, Object?>>> readReg() async{
    final db = await instance.database;
    final orderBy = 'id ASC';
    final query_result = await db!.query("reg",orderBy: orderBy);
    print(query_result);
    return query_result;
  }

  Future<List<Map<String, Object?>>> readOne(int month,int year) async{
    final db = await instance.database;
    final map = await db!.query("reg" ,
        columns: ["day, sale, expense"] ,
        where: 'month = $month AND year = $year',
        orderBy: 'day ASC',
        // whereArgs: [month,year],
    );
    //print(map);
    return map;
  }

  Future<List<Map<String, Object?>>> readsp(int day,int month,int year) async{
    final db = await instance.database;
    final map = await db!.query("reg" ,
      columns: ["sale, expense"] ,
      where: 'day = $day AND month = $month AND year = $year',
      // orderBy: 'day ASC',
      // whereArgs: [month,year],
    );
    //print(map);
    return map;
  }

  Future<List<Map<String, Object?>>> readByYear(int year) async{
    final db = await instance.database;
    final map = await db!.query("reg" ,
      columns: ["sale, expense"] ,
      where: 'year = $year',
      // orderBy: 'day ASC',
      // whereArgs: [month,year],
    );
    //print(map);
    return map;
  }


  Future<int> deleteReg (int month,int year,int day) async
  {
    final db= await instance.database;
    return await db!.delete('reg',where: 'month = $month AND year=$year AND day=$day');
  }
}
