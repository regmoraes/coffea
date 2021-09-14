import 'package:coffea/infrastructure/cubit.dart';
import 'package:coffea/ui/home_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeaApp extends StatelessWidget {
  const CoffeaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoffeaCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: HomePage(),
      ),
    );
  }
}
