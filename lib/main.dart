import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/bloc/internet/bloc/network_bloc.dart';
import 'package:flutter_eduapp_new/bloc/simple_bloc_observer.dart';
import 'package:flutter_eduapp_new/firebase_options.dart';
import 'package:flutter_eduapp_new/pages/home/page_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics.instance.logAppOpen();
    return MultiBlocProvider(
        providers: [
          BlocProvider<NetworkBloc>(
            create: (context) => NetworkBloc()..add(NetworkObserve()),
          ),
        ],
        child: MaterialApp(
          title: 'Абитуриент МИНСК',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xFF448AFF)),
            useMaterial3: true,
          ),
          home: const PageHome(),
        ));
  }
}
