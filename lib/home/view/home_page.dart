import 'package:fluther/home/blocs/weather/weather_bloc.dart';
import 'package:fluther/home/models/location_weather/location_weather.dart';
import 'package:fluther/home/view/widgets/search_button.dart';
import 'package:fluther/home/view/widgets/weather_details_bottom_bar.dart';
import 'package:fluther/home/view/widgets/weather_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  void initState() {
    setState(() {
      now = DateTime.now();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (BuildContext context, WeatherState state) {
          if (state is WeatherLoadInProgress) {
            return Column(
              children: const <Widget>[
                LinearProgressIndicator(),
              ],
            );
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
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    snap: true,
                    pinned: true,
                    floating: true,
                    title: ListTile(
                      title: Text(
                        locationWeather.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          '${dayFormat.format(now)} — ${dateFormat.format(now)}'),
                    ),
                    actions: <Widget>[
                      SearchButton(),
                    ],
                  ),
                  SliverFillRemaining(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            WeatherIcon(now),
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
                  )
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      bottomNavigationBar: WeatherDetailsBottomBar(),
    );
  }
}
