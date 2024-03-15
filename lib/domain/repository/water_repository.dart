import '../../core/app.dart';
import '../entity/water.dart';

abstract class WaterRepository {
  Future<void> addWater(Map<String, dynamic> map);
  Future<void> updateWater(
    int key,
    Map<String, dynamic> map,
  );
  Future<List<Water>> getWater();
  void onClose();
  void onDone();
  void onChage();
  Stream<Reload> get status;
}
