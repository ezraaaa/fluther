import 'package:fluther/home/view/widgets/search_button.dart';
import 'package:fluther/main/flavour_config.dart';
import 'package:fluther/resources/strings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: true,
            floating: true,
            title: Text(
                '${strings.appTitle} ${FlavourConfig.instance.values.currentFlavour}'),
            actions: <Widget>[
              SearchButton(),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const <Widget>[
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text(
                    'Kuala Lumpur',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Sunday — September 6'),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '31°',
                    textAlign: TextAlign.center,
                    textScaleFactor: 7.0,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                ListTile(
                  title: Text(
                    'Feels like 33°C. Few clouds. Light breeze',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                ListTile(
                  title: Text('Wind: 3.1m/s SSE'),
                  trailing: Text(
                    'Humidity: 58%',
                    textScaleFactor: 1.1,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                ListTile(
                  title: Text('Hourly'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
