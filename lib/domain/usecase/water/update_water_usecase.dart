import '../../../core/app.dart';
import '../../../core/use_case/use_case.dart';
import '../../entity/water.dart';
import '../../repository/water_repository.dart';

class UpdateWaterUseCase implements UserCase<void, Water> {
  final WaterRepository _waterRepository;
  UpdateWaterUseCase(this._waterRepository);
  @override
  Future<void> call({required Water params}) async {
    _waterRepository.updateWater(params.key, params.toMap());
  }

  @override
  void onChange() {}

  @override
  void onClose() {}

  @override
  void onDone() {}

  @override
  Stream<Reload> get status => _waterRepository.status;
}
