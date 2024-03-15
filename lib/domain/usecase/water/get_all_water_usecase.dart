import '../../../core/use_case/use_case.dart';
import '../../entity/water.dart';
import '../../repository/water_repository.dart';

class GetAllWaterUseCase implements UserCaseNoParams<void> {
  final WaterRepository _waterRepository;
  GetAllWaterUseCase(this._waterRepository);
  @override
  Future<List<Water>> call() async {
    return await _waterRepository.getWater();
  }
}
