import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver  {


  @override
  void onCreate(BlocBase bloc) {

    print(bloc);
    super.onCreate(bloc);
  }
  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
    super.onClose(bloc);
  }
}
