import 'package:flutter_bloc/flutter_bloc.dart';

abstract class VolumeEven{}
class VolumeUp extends VolumeEven{}
class VolumeDown extends VolumeEven{}
class VolumeMute extends VolumeEven{}

class VolumeBloc extends Bloc<VolumeEven, int> {
  VolumeBloc() : super(0) {
    on<VolumeUp> ((event, emit) => emit(state+5));
    on<VolumeDown> ((event, emit) => emit(state-5));
    on<VolumeMute> ((event, emit) => emit(0));
  }
}