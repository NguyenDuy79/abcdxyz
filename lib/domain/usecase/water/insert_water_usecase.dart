import '../../../core/app.dart';
import '../../../core/use_case/use_case.dart';
import '../../repository/water_repository.dart';

class InsertWaterUseCase implements UserCase<void, Map<String, dynamic>> {
  final WaterRepository _waterRepository;
  InsertWaterUseCase(this._waterRepository);
  @override
  Future<void> call({required Map<String, dynamic> params}) async {
    await _waterRepository.addWater(params);
  }

  @override
  void onClose() {
    _waterRepository.onClose();
  }

  @override
  void onDone() {
    _waterRepository.onDone();
  }

  @override
  Stream<Reload> get status => _waterRepository.status;

  @override
  void onChange() {
    _waterRepository.onChage();
  }
}
