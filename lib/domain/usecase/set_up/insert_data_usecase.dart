import '../../../core/app.dart';
import '../../../core/use_case/use_case.dart';
import '../../repository/infomation_repository.dart';

class InsretDataUseCase extends UserCase<void, Map<String, dynamic>> {
  final InfomationRepository _infomationRepository;
  InsretDataUseCase(this._infomationRepository);
  @override
  Future<void> call({required Map<String, dynamic> params}) async {
    await _infomationRepository.addInfomation(params);
  }

  @override
  void onClose() {
    _infomationRepository.onClose();
  }

  @override
  void onDone() {
    _infomationRepository.onDone();
  }

  @override
  Stream<Reload> get status => _infomationRepository.status;

  @override
  void onChange() {
    _infomationRepository.onChage();
  }
}
