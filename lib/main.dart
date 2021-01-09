import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/fruit_bloc.dart';
import 'home_page.dart';
import './bloc/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Wrapping the whole app with BlocProvider to get access to FruitBloc everywhere
    // BlocProvider extends InheritedWidget.
    return BlocProvider(
      create: FruitBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          accentColor: Colors.redAccent,
        ),
        home: HomePage(),
      ),
    );
  }
}
