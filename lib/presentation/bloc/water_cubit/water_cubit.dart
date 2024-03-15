import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/app.dart';
import '../../../domain/entity/water.dart';
import '../../../domain/usecase/water/get_all_water_usecase.dart';
import '../../../domain/usecase/water/insert_water_usecase.dart';
import '../../../domain/usecase/water/update_water_usecase.dart';

part 'water_state.dart';

class WaterCubit extends Cubit<WaterState> {
  final GetAllWaterUseCase _getAllWaterUseCase;
  final InsertWaterUseCase _insertWaterUseCase;
  final UpdateWaterUseCase _updateWaterUseCase;
  StreamSubscription? _streamSubscription;
  WaterCubit(
      {required GetAllWaterUseCase getAllWaterUseCase,
      required InsertWaterUseCase insertWaterUseCase,
      required UpdateWaterUseCase updateWaterUseCase})
      : _getAllWaterUseCase = getAllWaterUseCase,
        _insertWaterUseCase = insertWaterUseCase,
        _updateWaterUseCase = updateWaterUseCase,
        super(const WaterState(
          [],
        )) {
    _streamSubscription = _insertWaterUseCase.status.listen((event) async {
      if (event == Reload.yes) {
        final List<Water> newList = await _getAllWaterUseCase.call();

        emit(WaterState(
          newList,
        ));

        _insertWaterUseCase.onDone();
      }
    });
  }
  Future<void> insertWater(Map<String, dynamic> map) async {
    await _insertWaterUseCase.call(params: map);
  }

  Future<void> updateWater(Water water) async {
    await _updateWaterUseCase.call(params: water);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    _insertWaterUseCase.onClose();
    return super.close();
  }
}
