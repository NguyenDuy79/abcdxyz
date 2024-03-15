part of 'set_weight_cubit.dart';

class SetWeightState extends Equatable {
  const SetWeightState({
    this.errorText = '',
    this.weight = 100,
  });
  final String errorText;
  final double weight;

  SetWeightState copyWith({
    String? errorText,
    double? weight,
  }) {
    return SetWeightState(
        errorText: errorText ?? this.errorText, weight: weight ?? this.weight);
  }

  @override
  List<Object> get props => [
        errorText,
        weight,
      ];
}
