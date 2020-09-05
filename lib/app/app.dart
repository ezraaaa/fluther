import 'package:fluther/main/flavour_config.dart';
import 'package:fluther/resources/strings.dart';
import 'package:fluther/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: FlavourConfig.isDevelopment(),
        title:
            '${strings.appTitle} ${FlavourConfig.instance.values.currentFlavour}',
        theme: getThemeData(context),
        home: Scaffold(),
      ),
    );
  }
}
