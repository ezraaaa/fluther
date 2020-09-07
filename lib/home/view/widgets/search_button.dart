import 'package:fluther/home/blocs/weather/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchButton extends StatefulWidget {
  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String cityName;

  Future<void> _showSearchModelBottomSheet(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 150),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Wrap(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'City',
                            border: InputBorder.none,
                          ),
                          autofocus: true,
                          autocorrect: true,
                          textInputAction: TextInputAction.search,
                          onChanged: (String value) {
                            if (value.isNotEmpty) {
                              setState(() {
                                cityName = value;
                              });
                            }
                          },
                          onFieldSubmitted: (String term) {
                            _formKey.currentState.save();
                            BlocProvider.of<WeatherBloc>(context)
                                .add(WeatherRequested(cityName: cityName));
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const VerticalDivider(),
                      FlatButton(
                        onPressed: () {
                          _formKey.currentState.save();
                          BlocProvider.of<WeatherBloc>(context)
                              .add(WeatherRequested(cityName: cityName));
                          Navigator.pop(context);
                        },
                        child: const Text('Search'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Search Location',
      icon: const Icon(Icons.search),
      onPressed: () {
        _showSearchModelBottomSheet(context);
      },
    );
  }
}
