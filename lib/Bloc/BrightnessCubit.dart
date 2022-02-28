import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'BrightnessState.dart';

class BrightnessCubit extends Cubit<BrightnessState>  with HydratedMixin{
  BrightnessCubit() : super(BrightnessState(isDark: true));


  void high ( ) {
    print(state.isDark);
     // emit(BrightnessState(isDark: state.isDark +1));
  }

  void low ( ) {
    // emit(BrightnessState(isDark: state.isDark -1));

  }

  void toggleDark () {
     emit(BrightnessState(isDark: !state.isDark));
  }

  @override
  BrightnessState? fromJson(Map<String, dynamic> json) {
      return BrightnessState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(BrightnessState state) {
    return state.toJson();
  }
}