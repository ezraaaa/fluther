import 'package:fluther/home/blocs/weather/weather_bloc.dart';
import 'package:fluther/home/models/location_weather/location_weather.dart';
import 'package:fluther/home/view/widgets/search_button.dart';
import 'package:fluther/location/bloc/location/location_bloc.dart';
import 'package:fluther/main/flavour_config.dart';
import 'package:fluther/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NumberFormat numberFormat = NumberFormat.compact();
  final DateFormat dateFormat = DateFormat('MMMM d');
  final DateFormat dayFormat = DateFormat('EEEE');
  DateTime now;

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
  void initState() {
    setState(() {
      now = DateTime.now();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (BuildContext context, WeatherState state) {
            if (state is WeatherLoadSuccess) {
              final LocationWeather locationWeather = state.locationWeather;

              return ListTile(
                title: Text(
                  locationWeather.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    '${dayFormat.format(now)} — ${dateFormat.format(now)}'),
              );
            }
            return const SizedBox.shrink();
          },
        ),
        actions: <Widget>[
          SearchButton(),
        ],
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (BuildContext context, WeatherState state) {
          if (state is WeatherLoadInProgress) {
            return const LinearProgressIndicator();
          }
          if (state is WeatherLoadSuccess) {
            final LocationWeather locationWeather = state.locationWeather;

            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<WeatherBloc>(context).add(
                  WeatherRefreshRequested(
                    latitude: locationWeather.coordinates.latitude,
                    longitude: locationWeather.coordinates.longitude,
                  ),
                );
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        _buildWeatherIcon(locationWeather.weather[0].main, now),
                        size: 50.0,
                      ),
                      Text(
                        '${numberFormat.format(locationWeather.main.temp)}°',
                        textAlign: TextAlign.center,
                        textScaleFactor: 7.0,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      OutlineButton(
                        onPressed: () {},
                        child: const Text('Metrics'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<WeatherBloc, WeatherState>(
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
      ),
    );
  }
}
