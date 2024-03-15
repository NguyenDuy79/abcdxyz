import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app.dart';
import '../../../domain/entity/meal.dart';
import '../../../domain/usecase/meal/get_all_meal_usecase.dart';
import '../../../domain/usecase/meal/insert_meal_usecase.dart';

part 'nutri_state.dart';

class NutriCubit extends Cubit<NutriState> {
  final GetAllMealUseCase _getAllMealUseCase;
  final InsretMealUseCase _insretMealUseCase;
  StreamSubscription? _fetchMealResponse;
  NutriCubit({
    required GetAllMealUseCase getAllMealUseCase,
    required InsretMealUseCase insretMealUseCase,
  })  : _insretMealUseCase = insretMealUseCase,
        _getAllMealUseCase = getAllMealUseCase,
        super(const NutriState([])) {
    _fetchMealResponse = _insretMealUseCase.status.listen((event) async {
      if (event == Reload.yes) {
        print('aqwerqwerwr');
        List<Meal> listMeal = await _getAllMealUseCase.call();
        emit(NutriState(listMeal));
        _insretMealUseCase.onDone();
      }
    });
  }
  @override
  Future<void> close() {
    _fetchMealResponse?.cancel();
    _insretMealUseCase.onClose();
    return super.close();
  }
}
