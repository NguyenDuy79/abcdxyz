import 'dart:async';

import 'package:fitness_and_nutrition/data/source/local/database/database_manager.dart';
import 'package:sembast/sembast.dart';

import '../../../../core/resource/app_string.dart';
import '../../../../domain/entity/infomation.dart';
import '../../../dto/infomation_dto.dart';

class InfomationDatabase {
  static final InfomationDatabase _singleton = InfomationDatabase._();

  // Singleton accessor
  static InfomationDatabase get instance => _singleton;

  InfomationDatabase._();
  final _infomationStore = intMapStoreFactory.store(AppString.infomationTable);

  Database openDatabase = DatabaseManager.instance.db;

  Future<void> insert(Map<String, dynamic> map) async {
    await _infomationStore.add(openDatabase, map);
  }

  Future<List<Infomation>> getAllInfomation() async {
    final snapshots = await _infomationStore.find(openDatabase);
    return snapshots
        .map((infomation) => InfomationDto.fromJson(infomation.value))
        .toList();
  }
}
