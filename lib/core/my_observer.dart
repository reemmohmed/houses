import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('[Bloc Change] ${bloc.runtimeType}');
    log('Previous state: ${change.currentState}');
    log('New state: ${change.nextState}');
  }

  @override
  void onClose(BlocBase bloc) {
    log("[Bloc Closed] ${bloc.runtimeType}");
  }

  @override
  void onCreate(BlocBase bloc) {
    // log("[Bloc Created] ${bloc.runtimeType}");
    log("$bloc create");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}
