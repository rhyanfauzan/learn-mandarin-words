import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lmi_event.dart';
part 'lmi_state.dart';

class LmiBloc extends Bloc<LmiEvent, LmiState> {
  LmiBloc() : super(LmiInitial()) {
    on<LmiEvent>((event, emit) {});
  }
}
