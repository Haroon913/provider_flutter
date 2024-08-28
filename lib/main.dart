import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/auth_provider.dart';
import 'package:flutter_provider/provider/count_provider.dart';
import 'package:flutter_provider/provider/example_one_provider.dart';
import 'package:flutter_provider/provider/favourite_provider.dart';
import 'package:flutter_provider/provider/theme_changer_provider.dart';
import 'package:flutter_provider/screens/count_example.dart';
import 'package:flutter_provider/screens/darktheme.dart';
import 'package:flutter_provider/screens/example_one.dart';
import 'package:flutter_provider/screens/favourite/favouritescreen.dart';
import 'package:flutter_provider/screens/login.dart';
import 'package:flutter_provider/screens/value_notify_listner.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChanger()),
          ChangeNotifierProvider(create: (_) => AuthProvider())
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.teal,
                appBarTheme: AppBarTheme(backgroundColor: Colors.orange)),
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                appBarTheme: AppBarTheme(backgroundColor: Colors.teal)),
            home: LoginScreen(),
          );
        }));
  }
}
