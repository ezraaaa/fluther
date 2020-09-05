import 'package:bloc/bloc.dart';

class CommonBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onChange(Cubit<dynamic> cubit, Change<dynamic> change) {
    super.onChange(cubit, change);
    print(change);
  }

  @override
  void onError(Cubit<dynamic> cubit, Object error, StackTrace stackTrace) {
    super.onError(cubit, error, stackTrace);
    print(error);
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}
