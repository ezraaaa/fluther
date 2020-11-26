import 'package:fluther/common_widgets/illustrated_message.dart';
import 'package:fluther/common_widgets/loader.dart';
import 'package:fluther/home/blocs/weather/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:undraw/illustrations.dart';

class Temperature extends StatefulWidget {
  @override
  _TemperatureState createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  final NumberFormat numberFormat = NumberFormat.compact();

  Widget _buildTemperatureText(double temperature) {
    return Text(
      '${numberFormat.format(temperature)}°',
      textAlign: TextAlign.center,
      textScaleFactor: 7.0,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (BuildContext context, WeatherState state) {
        if (state is WeatherLoadSuccess) {
          return _buildTemperatureText(state.locationWeather.main.temp);
        } else if (state is WeatherLoadFailure) {
          return const IllustratedMessage(
            illustration: UnDrawIllustration.taken,
            child: Text('Could not load temperature'),
          );
        } else {
          return Loader(
            isShimmer: true,
            child: Text(
              'Loading',
              textScaleFactor: 4.0,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          );
        }
      },
    );
  }
}
