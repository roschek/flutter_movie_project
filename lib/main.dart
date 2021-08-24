import 'package:first_big_app/ui/my_app_model.dart';
import 'package:first_big_app/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final model = MyappModel();
  await model.checkAuth();
  runApp(MyApp(model: model));
}

class MyApp extends StatelessWidget {
  final MyappModel model;
  static final mainNavigation = MainNavigation();
  const MyApp({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: const Color.fromRGBO(3, 37, 65, 1),
            ),
            primarySwatch: Colors.blue,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
            )),
        initialRoute: mainNavigation.initialRoute(model.isAuth),
        routes: mainNavigation.routes);
  }
}
