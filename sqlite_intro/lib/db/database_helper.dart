import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_intro/model/note.dart';

/*
Để debug được sqlite của app mobile
- Android studio, chọn App inspection > Chọn process đúng tên với app của mình
  Chờ load db, nếu không có thể reload lại
  Để gọi các câu query chọn Open New Query Tab
Trên browser, cài đặt thêm deps   sqflite_common_ffi_web:
  Chạy lệnh dart run sqflite_common_ffi_web:setup
 */
class DatabaseHelper {
  static const _databaseFileName = 'prm393_notemanagement.db';
  static const _databaseVersion = 1;
  static const _tableName = 'notes';

  // Singleton = Luôn tồn tại chỉ duy nhất 1 instance trong cả app
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  // getter cho thuoc tinh `_database`
  Future<Database> get database async {
    _database ??= await _initDatabase();
    // a ??= b
    // a = a ?? b
    return _database!;
  }

  // Flow:
  // 1) Init DB ->
  // 1a) tao luong ket noi,
  // 1b) open db file,
  // 1c) tao du cac table (create tables)
  // 2) ... crud

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseFileName);
    print('>>> DB Path: ${path}');
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      content TEXT 
      )
    ''');
  }

  // CRUD
  // Get list
  Future<List<Note>> getList() async {
    // Ket noi
    final db = await database;

    // Truy van
    final List<Map<String, Object?>> maps = await db.query(_tableName, orderBy: 'id DESC');
    /*
    * [
    * {"id": 1, "title": "Ttitel note", "content": null},
    * {}
    * ]
    * */
    return [for (final map in maps) Note.fromJson(map)];
  }

  Future<int> insert(Note note) async {
    final db = await database;
    return db.insert(
        _tableName,
        note.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace // Nếu có id bị đụng độ, thì replace ghi đè lên
    );
  }
}