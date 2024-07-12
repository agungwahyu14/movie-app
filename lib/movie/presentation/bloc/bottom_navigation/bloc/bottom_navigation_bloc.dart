import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_navigation_event.dart';
import 'bottom_navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(currentIndex: 0)) {
    on<NavigationIndexChanged>((event, emit) {
      emit(NavigationState(currentIndex: event.index));
    });
  }
}
