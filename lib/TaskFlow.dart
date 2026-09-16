import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/Feature/Home/Presentation/manager/home_cubit.dart';
import 'package:to_do_list/core/navigation/AppRouter.dart';
import 'package:to_do_list/core/style/AppTheme.dart';

class TaskFlow extends StatelessWidget {
  const TaskFlow({super.key});
  @override
  Widget build(BuildContext context) {
   
    return MultiBlocProvider(
      providers: [
      BlocProvider(create: (context)=> HomeCubit())
      ],
      child: MaterialApp.router(
        title: 'Task Flow',
        debugShowCheckedModeBanner: false, 
        routerConfig: AppRouter.appRouter,
        theme: Apptheme.lightTheme,
      ),
    );
  }
}
