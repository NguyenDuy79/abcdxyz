import '../../../core/use_case/use_case.dart';
import '../../entity/infomation.dart';
import '../../repository/infomation_repository.dart';

class GetAllDataUseCase extends UserCaseNoParams<void> {
  final InfomationRepository _infomationRepository;
  GetAllDataUseCase(this._infomationRepository);
  @override
  Future<List<Infomation>> call() async {
    return await _infomationRepository.getInfomation();
  }

  // @override
  // void onClose() {
  //   _infomationRepository.onClose();
  // }

  // @override
  // void onDone() {
  //   _infomationRepository.onDone();
  // }

  // @override
  // Stream<Reload> get status => _infomationRepository.status;
}
