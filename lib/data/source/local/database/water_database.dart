import 'package:sembast/sembast.dart';

import '../../../../core/resource/app_string.dart';
import '../../../../domain/entity/water.dart';
import '../../../dto/water_dto.dart';
import 'database_manager.dart';

class WaterDatabase {
  static final WaterDatabase _singleton = WaterDatabase._();

  // Singleton accessor
  static WaterDatabase get instance => _singleton;

  WaterDatabase._();
  final _waterStore = intMapStoreFactory.store(AppString.waterTable);

  Database openDatabase = DatabaseManager.instance.db;

  Future<void> insert(Map<String, dynamic> map) async {
    await _waterStore.add(openDatabase, map);
  }

  Future<void> updateWater(int key, Map<String, dynamic> map) async {
    await _waterStore.record(key).update(openDatabase, map);
  }

  Future<List<Water>> getAllWater() async {
    final snapshots = await _waterStore.find(openDatabase);
    return snapshots.map((water) {
      // ignore: unused_local_variable

      return WaterDto.fromJson(water.key, water.value);
    }).toList();
  }
}
