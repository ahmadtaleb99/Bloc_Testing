import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:untitled/Bloc/NotificationState.dart';

class NotificationCubit extends Cubit<NotificationState>   {
  NotificationCubit() : super(EmailState(isToggled: true));


  Future<void> toggleEmail(bool value) async {
    emit(EmailLoading());
    await Future.delayed(Duration(seconds: 1));
    emit(EmailState(isToggled: value));
  }


}