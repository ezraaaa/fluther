import 'package:fluther/app/app.dart';
import 'package:fluther/home/blocs/weather/weather_bloc.dart';
import 'package:fluther/repositories/weather/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppStateProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: <RepositoryProvider<dynamic>>[
        RepositoryProvider<WeatherRepository>(
          create: (_) => WeatherRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: <BlocProvider<dynamic>>[
          BlocProvider<WeatherBloc>(
            create: (BuildContext context) {
              return WeatherBloc(
                weatherRepository:
                    RepositoryProvider.of<WeatherRepository>(context),
              );
            },
          ),
        ],
        child: App(),
      ),
    );
  }
}
