# Pylon App

## Purpose

### Technical Test for Developer From PylonAI

## Getting Started

The Boilerplate contains the minimal implementation required to create a new library or project. The repository code is preloaded with some basic components like basic app architecture, app theme, constants and required dependencies to create a new project. By using boiler plate code as standard initializer, we can have same patterns in all the projects that will inherit it. This will also help in reducing setup & development time by allowing you to use same code pattern and avoid re-writing from scratch.

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
git@github.com:VytouThin/pylon_app.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get
```

**Step 3:**

Go to project root and execute the following command in console to run project:

```
flutter run
```

## Boilerplate Features:

- Login
- Home
- Routing
- Theme
- Dio
- Flutter Riverpod (State Management)
- Validation
- Code Generation
- Path Provider

### Libraries & Tools Used

- [Dio](https://github.com/flutterchina/dio)
- [Flutter Riverpod](https://riverpod.dev/) (State Management)
- [Path Provider](https://github.com/flutter/packages/tree/main/packages/path_provider/path_provider)


### Folder Structure

Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|__ models/
| |__ employee.dart
|__ providers/
| |__ auth_provider.dart
| |__ employee_provider.dart
|__ screens/
| |__ employee_edit_page.dart
| |__ employee_list_page.dart
| |__ login_page.dart
| |__ signup_page.dart
|__ services/
| |__ api_service.dart
|__ widgets/
| |__ employee_card.dart
| |__ employee_form.dart
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- models - This directory contains data model classes. Models are used to represent the data structure of the application and are often used to parse JSON responses, store data, and manage business logic.
2- providers - This directory contains the state management classes. Providers are used to manage and provide the state of the application to various widgets.
3- screens - This directory contains the various screens (or pages) of the application. Each screen typically corresponds to a different route in the app and represents a distinct part of the user interface.
4- services — This directory contains the service classes. Services are used to handle the business logic and interact with external APIs, databases, or other data sources.
5- widgets — This directory contains reusable UI components. Widgets are used to build the user interface and can be composed to create more complex UI elements.
6- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

## Wiki

Checkout [wiki](https://github.com/zubairehman/flutter-boilerplate-project/wiki) for more info

## Conclusion

I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the boilerplate then please feel free to submit an issue and/or pull request 🙂

Again to note, this is example can appear as over-architectured for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.
