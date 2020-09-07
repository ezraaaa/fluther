import 'package:fluther/home/blocs/weather/weather_bloc.dart';
import 'package:fluther/home/models/location_weather/location_weather.dart';
import 'package:fluther/home/view/widgets/hourly_weather_list.dart';
import 'package:fluther/home/view/widgets/search_button.dart';
import 'package:fluther/location/bloc/location/location_bloc.dart';
import 'package:fluther/main/flavour_config.dart';
import 'package:fluther/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NumberFormat numberFormat = NumberFormat.compact();
  final DateFormat dateFormat = DateFormat('MMMM d');
  final DateFormat dayFormat = DateFormat('EEEE');
  DateTime now;

  @override
  void didChangeDependencies() {
    setState(() {
      now = DateTime.now();
    });
    BlocProvider.of<LocationBloc>(context).listen((LocationState state) {
      if (state is LocationRequestSuccess) {
        BlocProvider.of<WeatherBloc>(context).add(WeatherRequested(
          latitude: state.position.latitude,
          longitude: state.position.longitude,
        ));
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${strings.appTitle} ${FlavourConfig.instance.values.currentFlavour}'),
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

            return BlocBuilder<LocationBloc, LocationState>(
              builder: (BuildContext context, LocationState state) {
                if (state is LocationRequestSuccess) {
                  final Position position = state.position;

                  return RefreshIndicator(
                    onRefresh: () async {
                      BlocProvider.of<WeatherBloc>(context).add(
                        WeatherRefreshRequested(
                          latitude: position.latitude,
                          longitude: position.longitude,
                        ),
                      );
                    },
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.location_on,
                            color: Theme.of(context).accentColor,
                          ),
                          title: Text(
                            locationWeather.timezone,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              '${dayFormat.format(now)} — ${dateFormat.format(now)}'),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            '${numberFormat.format(locationWeather.current.temp)}°',
                            textAlign: TextAlign.center,
                            textScaleFactor: 7.0,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        ListTile(
                          title: Text(
                            'Feels like ${numberFormat.format(locationWeather.current.feelsLike)}°',
                            textScaleFactor: 1.1,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                  'Wind: ${locationWeather.current.windSpeed} m/sec'),
                              Text(
                                  'Humidity: ${locationWeather.current.humidity}%'),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        const ListTile(
                          title: Text('Hourly'),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Divider(),
                        ),
                        HourlyWeatherList(),
                      ],
                    ),
                  );
                } else if (state is LocationRequestInProgress) {
                  return const LinearProgressIndicator();
                }
                return const SizedBox.shrink();
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
