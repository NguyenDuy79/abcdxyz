part of 'water_cubit.dart';

class WaterState extends Equatable {
  const WaterState(this.listWater);
  final List<Water> listWater;

  @override
  List<Object> get props => [
        listWater,
      ];
}
