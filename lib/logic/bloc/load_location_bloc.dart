import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'load_location_event.dart';
part 'load_location_state.dart';

class LoadLocationBloc extends Bloc<LoadLocationEvent, LoadLocationState> {
  LoadLocationBloc() : super(LoadLocationInitial()) {
    on<LoadLocationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
