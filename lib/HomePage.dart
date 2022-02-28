import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Bloc/BrightnessCubit.dart';
import 'package:untitled/Bloc/BrightnessState.dart';
import 'package:untitled/Bloc/NotificationCubit.dart';
import 'package:untitled/SecondScreen.dart';
import 'package:untitled/main.dart';

import 'Bloc/NotificationState.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(

        appBar: AppBar(

        ),
        body: Container(
          child: Column(
            children: [
              Center(child:
              Text('hello world '),),
              BlocBuilder<NotificationCubit, NotificationState>(
                builder: (context, state) {
                  if (state is EmailLoading)
                    return CircularProgressIndicator();


                  else if (state is EmailState) {
                    return SwitchListTile(
                        value: state is EmailState ? state.isToggled : false,
                        title: Text('ads',style: TextStyle(
                          color:  kIsDarkMode ? Colors.red : Colors.blue
                        ),),
                        onChanged: (value) {
                          context.read<NotificationCubit>().toggleEmail(
                              value);
                        });
                  }
                  return Container();
                },
              ),
              SwitchListTile(
                  value: true, title: Text('Phone',style: TextStyle(
                  color:  kIsDarkMode ? Colors.red : Colors.blue
              ),), onChanged: (value) {
                context.read<NotificationCubit>().toggleEmail(value);
              }),

              SizedBox(height: 50,),
              ElevatedButton(onPressed: () {
                context.read<BrightnessCubit>().toggleDark();
              }, child: BlocBuilder<BrightnessCubit, BrightnessState>(
                builder: (context, state) {

                  return Text(state.isDark.toString());
                },
              )),
              ElevatedButton(onPressed: () {
                context.read<BrightnessCubit>().low();
              }, child: Text('Low ')),

              ElevatedButton(onPressed: () {
                context.read<BrightnessCubit>().close();
                Navigator.pop(context);

                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
              }, child: Text('go to  ')),

            ],
          ),
        )
    );
  }
}
