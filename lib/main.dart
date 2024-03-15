import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/bloc/internet/bloc/network_bloc.dart';
import 'package:flutter_eduapp_new/bloc/simple_bloc_observer.dart';
import 'package:flutter_eduapp_new/pages/home/page_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NetworkBloc>(
        create: (context) => NetworkBloc()..add(NetworkObserve()),
        child: MaterialApp(
          title: 'Абитуриент МИНСК',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
            useMaterial3: true,
          ),
          home: const PageHome(),
        ));
  }
}
