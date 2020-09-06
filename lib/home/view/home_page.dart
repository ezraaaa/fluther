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
        ],
      ),
    );
  }
}
