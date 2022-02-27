import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Bloc/NotificationState.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(EmailState(isToggled: true));

  bool isToggled =false ;
  String _s;



  void toggleEmail (bool value ){
    emit(EmailState(isToggled: !value));
  }

}