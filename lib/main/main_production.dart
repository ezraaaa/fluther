import 'package:fluther/app/app_state_provider.dart';
import 'package:fluther/common_bloc_observer.dart';
import 'package:fluther/main/flavour_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CommonBlocObserver();

  FlavourConfig(
    flavour: Flavour.production,
    values: const FlavourValues(currentFlavour: ''),
  );

  runApp(AppStateProvider());
}
