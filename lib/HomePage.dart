import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Bloc/NotificationCubit.dart';

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
                  return SwitchListTile(value: false,
                      title: Text('ads'),
                      onChanged: (value) {
                        context.read<NotificationCubit>().toggleEmail();
                      });
                },
              ),
              SwitchListTile(
                  value: false, title: Text('Phone'), onChanged: (value) {}),

            ],
          ),
        )
    );
  }
}
