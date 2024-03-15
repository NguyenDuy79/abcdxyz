part of 'infomation_cubit.dart';

class InfomationState extends Equatable {
  const InfomationState(this.listInfomation, this.check);
  final List<Infomation> listInfomation;
  final int check;
  @override
  List<Object> get props => [listInfomation, check];
}
