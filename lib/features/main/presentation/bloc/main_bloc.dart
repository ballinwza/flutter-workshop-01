import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_state.dart';

class MainBloc extends Bloc<MainState, int> {
  MainBloc() : super(1) {
    on<MainIncrement>((event, emit) => emit(state + 1));
    on<MainDecrement>((event, emit) => emit(state - 1));
  }
}
