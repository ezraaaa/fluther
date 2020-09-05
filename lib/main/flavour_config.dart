import 'package:meta/meta.dart' show required;

enum Flavour { development, staging, production }

class FlavourValues {
  const FlavourValues({@required this.currentFlavour})
      : assert(currentFlavour != null);

  /// Current flavour of the app...
  final String currentFlavour;
}

class FlavourConfig {
  factory FlavourConfig({
    @required Flavour flavour,
    @required FlavourValues values,
  }) {
    _instance ??= FlavourConfig._internal(flavour, values);
    return _instance;
  }

  FlavourConfig._internal(this.flavour, this.values);

  /// Flavour name as enum of `Flavour`.
  final Flavour flavour;

  /// Contains all the properties as mentioned in the `FlavourValues`.
  final FlavourValues values;

  static FlavourConfig _instance;

  static FlavourConfig get instance => _instance;

  /// Is the app in `development` phase.
  static bool isDevelopment() => _instance.flavour == Flavour.development;

  /// Is the app in `staging` phase.
  static bool isStaging() => _instance.flavour == Flavour.staging;

  /// Is the app in `production` phase.
  static bool isProduction() => _instance.flavour == Flavour.production;
}
