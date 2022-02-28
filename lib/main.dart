import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/Bloc/BrightnessCubit.dart';
import 'package:untitled/Bloc/NotificationCubit.dart';
import 'package:untitled/Bloc/blocObserver.dart';

import 'Bloc/BrightnessState.dart';
import 'HomePage.dart';

 bool kIsDarkMode = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );


  HydratedBlocOverrides.runZoned(
        () => runApp(MyApp()),
    blocObserver: AppBlocObserver(),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BrightnessCubit(),
      child: BlocBuilder<BrightnessCubit, BrightnessState>(
        builder: (context, state) {
          kIsDarkMode = state.isDark;

          return MaterialApp(
            theme: ThemeData(
        brightness: state.isDark ?  Brightness.dark : Brightness.light
            ),
            home:
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => NotificationCubit(),
                ),

              ],
              child: HomePage(),
            ),
          );
        },
      ),
    );
  }
}