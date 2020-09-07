import 'package:fluther/app/app.dart';
import 'package:fluther/home/blocs/weather/weather_bloc.dart';
import 'package:fluther/location/bloc/location/location_bloc.dart';
import 'package:fluther/repositories/location/location_repository.dart';
import 'package:fluther/repositories/weather/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppStateProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: <RepositoryProvider<dynamic>>[
        RepositoryProvider<LocationRepository>(
          create: (_) => LocationRepository(),
        ),
        RepositoryProvider<WeatherRepository>(
          create: (_) => WeatherRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: <BlocProvider<dynamic>>[
          BlocProvider<LocationBloc>(
            create: (BuildContext context) {
              return LocationBloc(
                locationRepository:
                    RepositoryProvider.of<LocationRepository>(context),
              )..add(LocationPermissionRequested());
            },
          ),
          BlocProvider<WeatherBloc>(
            create: (BuildContext context) {
              return WeatherBloc(
                weatherRepository:
                    RepositoryProvider.of<WeatherRepository>(context),
                locationBloc: BlocProvider.of<LocationBloc>(context),
              );
            },
          ),
        ],
        child: App(),
      ),
    );
  }
}
