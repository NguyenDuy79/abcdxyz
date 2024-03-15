import 'dart:async';

import '../../core/app.dart';
import '../entity/infomation.dart';

abstract class InfomationRepository {
  Future<void> addInfomation(Map<String, dynamic> map);
  Future<List<Infomation>> getInfomation();
  void onClose();
  void onDone();
  void onChage();
  Stream<Reload> get status;
}
