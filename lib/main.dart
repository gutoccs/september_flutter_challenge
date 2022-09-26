import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:september_flutter_challenge/bloc/gif/gif_cubit.dart';
import 'package:september_flutter_challenge/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => new GifCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Challenge',
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => HomeScreen(),
        },
      ),
    );
  }
}
