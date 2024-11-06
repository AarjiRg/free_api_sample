import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_api_sample/bloc/home/home_bloc.dart';
import 'package:free_api_sample/bloc/home/home_event.dart';
import 'package:free_api_sample/bloc/login_bloc.dart';
import 'package:free_api_sample/screens/login.dart';
import 'package:free_api_sample/screens/splash_screen.dart';


void main(List<String> args) {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => HomeBloc()..add(fetchproductlist()),)
        ],
        
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}