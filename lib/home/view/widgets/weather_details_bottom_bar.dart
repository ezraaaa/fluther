import 'package:fluther/home/blocs/weather/weather_bloc.dart';
import 'package:fluther/home/models/location_weather/location_weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class WeatherDetailsBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NumberFormat numberFormat = NumberFormat.compact();

    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (BuildContext context, WeatherState state) {
        if (state is WeatherLoadSuccess) {
          final LocationWeather locationWeather = state.locationWeather;

          return BottomAppBar(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Feels like ${numberFormat.format(locationWeather.main.feelsLike)}°',
                    textScaleFactor: 1.1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' ${locationWeather.main.tempMin}° —  ${locationWeather.main.tempMax}°',
                    textScaleFactor: 1.1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Wind: ${locationWeather.wind.speed} m/sec'),
                  Text('Humidity: ${locationWeather.main.humidity}%'),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
