import 'package:flutter/material.dart';
import 'package:random_user/src/view/details_view.dart';
import 'package:random_user/src/view/home_view.dart';
import 'package:random_user/src/view/saved_users_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App teste Bus2',
      routes: {
        '/home': (_) => const HomeView(),
        '/saved_users' : (_) => const SavedUsersView(),
        },
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xff171717),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff72C460),
          brightness: Brightness.dark,
        ),

        fontFamily: 'RobotoCondensed',

        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0, backgroundColor: Color(0xff72C460),),
      ),
    );
  }
}
