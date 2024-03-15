import 'dart:async';

import '../app.dart';

abstract class UserCase<R, P> {
  Future<R> call({required P params});
  void onClose();
  void onDone();
  Stream<Reload> get status;
  void onChange();
}

abstract class UserCaseNoParams<R> {
  Future<R> call();
  // void onClose();
  // Stream<Reload> get status;
  // void onDone();
}
