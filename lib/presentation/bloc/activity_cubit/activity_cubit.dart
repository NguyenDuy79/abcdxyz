import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'activity_state.dart';

class ActivityCubit extends Cubit<ActivityState> {
  ActivityCubit() : super(ActivityInitial());
}
