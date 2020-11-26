import 'package:fluther/common_widgets/loader.dart';
import 'package:fluther/home/blocs/weather/weather_bloc.dart';
import 'package:fluther/home/models/location_weather/location_weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WeatherIcon extends StatefulWidget {
  const WeatherIcon(this.now);
  final DateTime now;

  @override
  _WeatherIconState createState() => _WeatherIconState();
}

class _WeatherIconState extends State<WeatherIcon> {
  IconData _buildWeatherIcon(String weatherMain, DateTime date) {
    switch (weatherMain) {
      case 'Clouds':
        return MdiIcons.weatherCloudy;
        break;
      case 'Rain':
        return MdiIcons.weatherRainy;
        break;
      case 'Clear':
        if (date.hour > 17) {
          return MdiIcons.weatherNight;
        } else {
          return MdiIcons.weatherSunny;
        }
        break;
      case 'Tornado':
        return MdiIcons.weatherTornado;
        break;
      case 'Fog':
        return MdiIcons.weatherFog;
        break;
      case 'Mist':
        return MdiIcons.weatherFog;
        break;
      case 'Snow':
        return MdiIcons.weatherSnowy;
        break;
      case 'Drizzle':
        return MdiIcons.weatherPartlyRainy;
        break;
      case 'Thunderstorm':
        return MdiIcons.weatherLightningRainy;
        break;
      default:
        return null;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (BuildContext context, WeatherState state) {
        if (state is WeatherLoadSuccess) {
          final LocationWeather locationWeather = state.locationWeather;
          return Icon(
            _buildWeatherIcon(locationWeather.weather[0].main, widget.now),
            size: 50.0,
          );
        } else if (state is WeatherLoadFailure) {
          return const Icon(
            Icons.error_outline,
            size: 50.0,
          );
        } else {
          return Loader(
            isShimmer: true,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.circular(16.0),
              ),
              height: 50.0,
              width: 50.0,
            ),
          );
        }
      },
    );
  }
}
