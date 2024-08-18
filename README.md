# Interactive - Nuzo and Namia App

A Flutter App adopted from Nuzo and Namia show

## Overview
Interactive - Nuzo and Namia App is a mobile application that is adopted from the Nuzo and Namia show. The app is designed to be interactive and engaging for children.

### How It Works
The App begins with a video playing an opening scene. Once the scene ends, the player is prompted with a simple quiz game that asks the player to select the correct answer based on the information given on the screen. There are various combinations that the player can choose from, and the player can select the correct answer by tapping the correct item on the screen. Once the player completes all combinations correctly, the App plays the closing scene and the game ends.

### App Screenshots
|  |  |  |
| ------------- |------------- |------------- |
| ![Bubelang trapped](https://github.com/kaykhahima/interactive-nuzo-and-namia/blob/main/assets/images/screenshot_bubelang_trapped.jpg "Bubelang trapped")  | ![Combination one](https://github.com/kaykhahima/interactive-nuzo-and-namia/blob/main/assets/images/screenshot_combination_1.jpg "Combination one")  | ![Combination one - correct](https://github.com/kaykhahima/interactive-nuzo-and-namia/blob/main/assets/images/screenshot_combination_1_correct.jpg "Combination one - correct")  |
| ![Combination one - incorrect](https://github.com/kaykhahima/interactive-nuzo-and-namia/blob/main/assets/images/screenshot_combination_1_incorrect.jpg "Combination one - incorrect")  | ![Combination two](https://github.com/kaykhahima/interactive-nuzo-and-namia/blob/main/assets/images/screenshot_combination_2.jpg "Combination two")  | ![Bubelang freed](https://github.com/kaykhahima/interactive-nuzo-and-namia/blob/main/assets/images/screenshot_bubelang_free.jpg "Bubelang freed")  |


## Technical Documentation
This App is built using Flutter, a cross-platform mobile application development framework.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

### Operating principles
This App sends and receives data from Appwrite server. The Appwrite server is a cloud and self-hosted solution that provides a set of APIs for building applications. It is used to store the resource information such as the items and combinations.

If you are new to Appwrite, you can get started by following the [Appwrite documentation](https://appwrite.io/docs/quick-starts/flutter). 

### Application Architecture
The App is built using the **Model-View-ViewModel (MVVM)** architecture. This architecture is used to separate the user interface from the business logic. The ViewModel is responsible for handling the business logic and the communication between the Model and the View.

To learn more on Flutter with MVVM, visit [Using MVVM for your application's architecture](https://docs.flutter.dev/get-started/fwe/state-management#using-mvvm-for-your-applications-architecture).

### Project Structure

```
lib/
├── main.dart
├── service_locator.dart
├── config/
│   ├── routes/
│   │   └── app_routes.dart
│   └── theme/
│       └── app_theme.dart
├── core/
│   └── network/
│       └── network_info.dart
├── features/
│   └── game/
│       ├── model/
│       │   ├── game_model.dart
│       │   ├── combination_model.dart
│       │   └── item_model.dart
│       ├── view/
│       │   ├── game_page.dart
│       │   ├── video_page.dart
│       │   └── widgets/
│       │       ├── combination_list.dart
│       │       ├── combination_tile.dart
│       │       ├── item_list.dart
│       │       ├── item_tile.dart
│       │       ├── video_screen.dart
│       │       └── game_play_screen.dart
│       └── view_model/
│           └── game_view_model.dart
├── helpers/
│   └── helper_methods.dart
├── shared/
│   └── providers_list.dart
└── utils/
    ├── constants.dart   
    └── navigation_keys.dart

```

### Dependencies
The App uses the following dependencies:
- [go_router](https://pub.dev/packages/go_router) - A declarative, customizable router for Flutter.
- [dart_mappable](https://pub.dev/packages/dart_mappable) - A simple and powerful library for mapping JSON objects to Dart objects.
- [provider](https://pub.dev/packages/provider) - A state management library for Flutter.
- [get_it](https://pub.dev/packages/get_it) - A simple Service Locator for Dart and Flutter projects.
- [flex_color_scheme](https://pub.dev/packages/flex_color_scheme) - A Flutter package to help you make beautiful color scheme based on FlexColorScheme.
- [video_player](https://pub.dev/packages/video_player) - A Flutter plugin for displaying videos
- [internet_connection_checker_plus](https://pub.dev/packages/internet_connection_checker_plus) - A Flutter plugin for discovering the state of the network (WiFi & mobile/cellular) connectivity on Android and iOS.
- [cached_network_image](https://pub.dev/packages/cached_network_image) - A flutter library to show images from the internet and keep them in the cache directory.
- [appwrite](https://pub.dev/packages/appwrite) - A Dart client library for Appwrite.
- [chewie](https://pub.dev/packages/chewie) - A video player for Flutter with overlay support.

### Getting Started
To get started with this project, you need to have Flutter installed on your machine. If you don't have Flutter installed, you can follow the instructions on the [Flutter documentation](https://flutter.dev/docs/get-started/install).

To run the project, you need to clone the repository and run the following command:


```bash
flutter pub get
```

```bash
flutter run
```

