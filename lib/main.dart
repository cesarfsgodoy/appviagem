import 'package:appviagem/cubit/app_cubit_logics.dart';
import 'package:appviagem/cubit/app_cubits.dart';
import 'package:appviagem/pages/detail_page.dart';
import 'package:appviagem/services/data_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './pages/navpages/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'App Viagem',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black),
                elevation: 0,
                backgroundColor: Colors.white)),
        home: BlocProvider<AppCubits>(
          create: (context) => AppCubits(
            data:DataServices(),
          ),
          child: AppCubitLogics(),
        ));
  }
}
