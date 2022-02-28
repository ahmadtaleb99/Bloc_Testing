import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Bloc/BrightnessCubit.dart';
import 'package:untitled/Bloc/BrightnessState.dart';
import 'package:untitled/Bloc/NotificationCubit.dart';
import 'package:untitled/Bloc/NotificationCubit.dart';
import 'package:untitled/HomePage.dart';

import 'Bloc/NotificationState.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        }, child: BlocBuilder<BrightnessCubit, BrightnessState>(
          builder: (context, state) {
            return Text('back ');
          },
        )),
      ),
    );
  }
}
