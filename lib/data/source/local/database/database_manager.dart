import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DatabaseManager {
  static final DatabaseManager _singleton = DatabaseManager._();
  static DatabaseManager get instance => _singleton;
  DatabaseManager._();
  late Database _db;
  Database get db => _db;
  Future<void> openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(
      appDocumentDir.path,
      'fitness.db',
    );
    _db = await databaseFactoryIo.openDatabase(dbPath);
  }

  Future<void> close() async {
    await _db.close();
  }
}
