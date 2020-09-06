import 'package:fluther/home/blocs/weather/weather_bloc.dart';
import 'package:fluther/home/models/hourly/hourly.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HourlyWeatherList extends StatefulWidget {
  @override
  _HourlyWeatherListState createState() => _HourlyWeatherListState();
}

class _HourlyWeatherListState extends State<HourlyWeatherList> {
  Widget _buildWeatherIcon(String weatherMain, DateTime date) {
    switch (weatherMain) {
      case 'Clouds':
        return const Icon(MdiIcons.weatherCloudy);
        break;
      case 'Rain':
        return const Icon(MdiIcons.weatherRainy);
        break;
      case 'Clear':
        if (date.hour > 17) {
          return const Icon(MdiIcons.weatherNight);
        } else {
          return const Icon(MdiIcons.weatherSunny);
        }
        break;
      case 'Tornado':
        return const Icon(MdiIcons.weatherTornado);
        break;
      case 'Fog':
        return const Icon(MdiIcons.weatherFog);
        break;
      case 'Mist':
        return const Icon(MdiIcons.weatherFog);
        break;
      case 'Snow':
        return const Icon(MdiIcons.weatherSnowy);
        break;
      case 'Drizzle':
        return const Icon(MdiIcons.weatherPartlyRainy);
        break;
      case 'Thunderstorm':
        return const Icon(MdiIcons.weatherLightningRainy);
        break;
      default:
        return Text(weatherMain);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat hourFormat = DateFormat('h a');
    final DateFormat dateFormat = DateFormat('d MMM');
    final NumberFormat numberFormat = NumberFormat.compact();

    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (BuildContext context, WeatherState state) {
        if (state is WeatherLoadSuccess) {
          final List<Hourly> hourlyWeather = state.locationWeather.hourly;

          return ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final Hourly weather = hourlyWeather[index];
              final DateTime date =
                  DateTime.fromMillisecondsSinceEpoch(weather.dt * 1000);
              return ListTile(
                title: Wrap(
                  children: <Widget>[
                    Text(hourFormat.format(date) + ', '),
                    Text(dateFormat.format(date))
                  ],
                ),
                trailing: Wrap(
                  spacing: 16.0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    _buildWeatherIcon(weather.weather[0].main, date),
                    Text('${numberFormat.format(weather.temp)}°'),
                  ],
                ),
              );
            },
            separatorBuilder: (_, int index) => const SizedBox(
              height: 16.0,
            ),
            itemCount: hourlyWeather.length,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
