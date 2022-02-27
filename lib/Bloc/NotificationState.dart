import 'package:equatable/equatable.dart';

abstract class NotificationState extends Equatable {

}

class EmailState extends NotificationState {
  EmailState({required this.isToggled});

  bool isToggled = false ;
  @override
  // TODO: implement props
  List<Object?> get props => [isToggled ];

}


class PhoneState extends NotificationState {
  bool isToggled = false ;

  PhoneState({required this.isToggled});

  @override
  // TODO: implement props
  List<Object?> get props => [isToggled] ;

}
