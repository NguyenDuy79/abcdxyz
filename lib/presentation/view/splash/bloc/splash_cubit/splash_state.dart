part of 'splash_cubit.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

final class SplashInitial extends SplashState {}

final class SplashLoaded extends SplashState {
  final bool data;
  const SplashLoaded(this.data);
  @override
  List<Object> get props => [data];
}
