import 'package:car_studio/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/bloc/bloc_observer.dart';
import 'app/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Future.wait([serviceLocatorInit()]);
  runApp(const CarWashingApp());
}
