import 'package:contact_diary_aaplication/controller/Theme_Controller.dart';
import 'package:contact_diary_aaplication/utils/MyRoutes.dart';
import 'package:contact_diary_aaplication/utils/color_utils.dart';
import 'package:contact_diary_aaplication/views/screens/HomePage.dart';
import 'package:contact_diary_aaplication/views/screens/Splash_Screen.dart';
import 'package:contact_diary_aaplication/views/screens/add_contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/Contact_Controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (cotext) => Theme_Controller(preferences: preferences),
        ),
        ChangeNotifierProvider(
          create: (cotext) => ContactController(preferences: preferences),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          // foregroundColor: Colors.white,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontSize: 18,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: theme_green,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: theme_green,
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          // foregroundColor: Colors.white,
        ),
        snackBarTheme: SnackBarThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          behavior: SnackBarBehavior.floating,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 18, color: Colors.white),
          bodySmall: TextStyle(fontSize: 16, color: Colors.white),
          bodyLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        useMaterial3: true,
      ),
      themeMode: Provider.of<Theme_Controller>(context).getTheme
          ? ThemeMode.dark
          : ThemeMode.light,
      initialRoute: MyRoutes.Splash_Screen,
      routes: {
        MyRoutes.home: (context) => HomePage(),
        MyRoutes.Splash_Screen: (context) => Splash_Screen(),
        MyRoutes.AddContact: (context) => AddContact(),
      },
    );
  }
}
