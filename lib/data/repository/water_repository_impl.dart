import 'dart:async';
import '../../core/app.dart';
import '../../domain/entity/water.dart';
import '../../domain/repository/water_repository.dart';
import '../source/local/database/water_database.dart';

class WaterRepositoryImpl implements WaterRepository {
  @override
  Future<void> addWater(Map<String, dynamic> map) async {
    await WaterDatabase.instance.insert(map);
  }

  @override
  Future<List<Water>> getWater() async {
    return await WaterDatabase.instance.getAllWater();
  }

  @override
  Future<void> updateWater(int key, Map<String, dynamic> map) async {
    await WaterDatabase.instance
        .updateWater(key, map)
        .then((value) => onChage());
  }

  final StreamController<Reload> _controller = StreamController<Reload>();
  @override
  Stream<Reload> get status async* {
    yield Reload.yes;
    yield* _controller.stream;
  }

  @override
  @override
  void onDone() {
    _controller.add(Reload.no);
  }

  @override
  void onClose() {
    _controller.close();
  }

  @override
  void onChage() {
    _controller.add(Reload.yes);
  }
}
