import 'package:first_big_app/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter/material.dart';
import './widgets/auth/auth_widget.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: const Color.fromRGBO(3, 37, 65, 1),),
            primarySwatch: Colors.blue,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        )
      ),

      initialRoute: '/main',
      routes: {
        '/auth': (context) => AuthWidget(),
        '/main': (context) => MainScreenWidget()
      },

    );
  }
}

