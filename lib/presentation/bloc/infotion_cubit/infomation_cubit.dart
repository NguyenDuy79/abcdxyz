import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app.dart';
import '../../../domain/entity/infomation.dart';
import '../../../domain/usecase/set_up/get_all_data_usecase.dart';
import '../../../domain/usecase/set_up/insert_data_usecase.dart';
part 'infomation_state.dart';

class InfomationCubit extends Cubit<InfomationState> {
  final GetAllDataUseCase _getAllDataUseCase;
  final InsretDataUseCase _insretDataUseCase;
  StreamSubscription? _fetchInfomationResponse;
  InfomationCubit(
      {required GetAllDataUseCase getAllDataUseCase,
      required InsretDataUseCase insretDataUseCase})
      : _getAllDataUseCase = getAllDataUseCase,
        _insretDataUseCase = insretDataUseCase,
        super(const InfomationState([], 0)) {
    _fetchInfomationResponse?.cancel();
    _fetchInfomationResponse = _insretDataUseCase.status.listen((event) async {
      if (event == Reload.yes) {
        print('adad');
        List<Infomation> listData = await _getAllDataUseCase.call();

        if (listData.isNotEmpty) {
          emit(InfomationState(listData, 2));
          print('notempty');
        } else {
          print('empty');
          emit(const InfomationState([], 1));
        }
      }
      _insretDataUseCase.onDone();
    });
  }
  Future<void> addInfomation(Infomation infomation) async {
    await _insretDataUseCase.call(params: infomation.toMap());
    _insretDataUseCase.onChange();
  }

  @override
  Future<void> close() {
    _fetchInfomationResponse?.cancel();
    _insretDataUseCase.onClose();
    return super.close();
  }
}
