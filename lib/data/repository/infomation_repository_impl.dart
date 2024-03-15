import 'dart:async';

import '../../core/app.dart';
import '../../domain/entity/infomation.dart';
import '../../domain/repository/infomation_repository.dart';
import '../source/local/database/infomation_database.dart';

class InfomationRepositoryImpl implements InfomationRepository {
  @override
  Future<void> addInfomation(Map<String, dynamic> map) async {
    await InfomationDatabase.instance.insert(map);
  }

  @override
  Future<List<Infomation>> getInfomation() async {
    List<Infomation> data =
        await InfomationDatabase.instance.getAllInfomation();
    print(data);
    return data;
  }

  final StreamController<Reload> _controller = StreamController<Reload>();
  @override
  Stream<Reload> get status async* {
    yield Reload.yes;
    yield* _controller.stream;
  }

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
