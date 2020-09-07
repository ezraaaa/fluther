# fluther

Fluther is a weather app made of Flutter with Open Weather and flutter_bloc

## Getting Started

Before we get started, let's make sure your computer is done setting up. Follow this [guide](https://flutter.io/get-started/install/)
To know if your computer is done setting up, run this command in your terminal:
```
flutter doctor
```

Once you are done setting up, run the following command in your terminal

```
https://github.com/ezraaaa/fluther.git
cd fluther
flutter packages get
open -a Simulator
flutter run -t lib/main/main_development.dart --flavor development
```

## Generating launcher icons

Place your icon into `assets/logo` folder and name it `fluther.png` and run the command below
```
flutter pub pub run flutter_launcher_icons:main
```

## Using json_serializable
To watch for changes and generate model, run command:
```
flutter pub run build_runner watch
```

## Build and Release
### Build release APK
To build and release for Android, follow this [guide](https://flutter.io/android-release/) and you can run the following command:

1. Create `key.properties` file in `android` folder and copy the references below as content:
    ```
    storePassword=android
    keyPassword=android
    keyAlias=key
    storeFile=/Users/<username>/codeink_key.jks
    ```
2. Download the [keystore](https://drive.google.com/open?id=1Wp3UCZkx33D2j6PHi-mlDV3A5Pdm-5YH) and put into the path you defined in step 1
3. Run command:
    ```
    flutter build apk -t lib/main/main_production.dart --flavor production
    ```
    or just simply copy the command below
    ```
    flutter build apk -t lib/main/main_production.dart --flavor production && cd build/app/outputs/flutter-apk/ && open . && cd ../../../../
    ```

### Build App Bundle
1. Follow step 1 and step 2 in `Build release APK`
2. Run command:
    ```
    flutter build appbundle -t lib/main_production.dart --flavor production
    ```
    or just simply copy the command below
    ```
    flutter build appbundle -t lib/main/main_production.dart --flavor production && cd build/app/outputs/bundle/productionRelease/ && open . && cd ../../../../../
    ```

To build and release for iOS, follow this [guide](https://flutter.io/ios-release/)