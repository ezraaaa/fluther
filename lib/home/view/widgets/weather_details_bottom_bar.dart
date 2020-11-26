import 'package:fluther/common_widgets/loader.dart';
import 'package:fluther/home/blocs/weather/weather_bloc.dart';
import 'package:fluther/home/models/location_weather/location_weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class WeatherDetailsBottomBar extends StatefulWidget {
  @override
  _WeatherDetailsBottomBarState createState() =>
      _WeatherDetailsBottomBarState();
}

class _WeatherDetailsBottomBarState extends State<WeatherDetailsBottomBar> {
  final NumberFormat numberFormat = NumberFormat.compact();

  Widget _buildTitle({LocationWeather locationWeather}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          locationWeather != null
              ? 'Feels like ${numberFormat.format(locationWeather.main.feelsLike)}°'
              : 'Fail to load',
          textScaleFactor: 1.1,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          locationWeather != null
              ? '${locationWeather.main.tempMin}° —  ${locationWeather.main.tempMax}°'
              : 'Fail to load',
          textScaleFactor: 1.1,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget _buildSubtitle({LocationWeather locationWeather}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(locationWeather != null
            ? 'Wind: ${locationWeather.wind.speed} m/sec'
            : 'Fail to load'),
        Text(locationWeather != null
            ? 'Humidity: ${locationWeather.main.humidity}%'
            : 'Fail to load'),
      ],
    );
  }

  Widget _buildLoader() {
    return Loader(
      isShimmer: true,
      child: Row(
        children: const <Widget>[
          Text('Loading'),
          Text('Loading'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: ListTile(
        title: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (BuildContext context, WeatherState state) {
            if (state is WeatherLoadSuccess) {
              final LocationWeather locationWeather = state.locationWeather;

              return _buildTitle(locationWeather: locationWeather);
            } else if (state is WeatherLoadFailure) {
              return _buildTitle();
            } else {
              return _buildLoader();
            }
          },
        ),
        subtitle: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (BuildContext context, WeatherState state) {
            if (state is WeatherLoadSuccess) {
              final LocationWeather locationWeather = state.locationWeather;
              return _buildSubtitle(locationWeather: locationWeather);
            } else if (state is WeatherLoadFailure) {
              return _buildSubtitle();
            } else {
              return _buildLoader();
            }
          },
        ),
      ),
    );
  }
}
