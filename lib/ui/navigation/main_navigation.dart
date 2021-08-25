import 'package:first_big_app/library/notify_provider.dart';
import 'package:first_big_app/ui/widgets/auth/auth_model.dart';
import 'package:first_big_app/ui/widgets/auth/auth_widget.dart';
import 'package:first_big_app/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:first_big_app/ui/widgets/movie_details/movie_details_sections/movie_details_model.dart';
import 'package:first_big_app/ui/widgets/movie_details/movie_details_widget.dart';
import 'package:first_big_app/utility/movie_details.dart';
import 'package:flutter/cupertino.dart';

abstract class MainNavigationRouteNames {
  static const auth = 'auth';
  static const main = '/';
  static const movieDetails = '/movie_details';
}

class MainNavigation {
  String initialRoute(bool isAuth) =>
      isAuth ? MainNavigationRouteNames.main : MainNavigationRouteNames.auth;
  final routes = <String, Widget Function(BuildContext)>{
    'auth': (context) => NotifyProvider(model: AuthModel(), child: AuthWidget()),
    '/': (context) => MainScreenWidget(),
    '/movie_details': (context) {
      final arguments = ModalRoute.of(context)?.settings.arguments as int;
      final movieId = arguments is int ? arguments : 0;
      if (arguments is int) {
        return NotifyProvider(model: MovieDetailsModel(movieId)..loadDetails(), child: MovieDetailsWidget(movieId: movieId));
      } else {
        return MovieDetailsWidget(movieId: 1);
      }
    }
  };
}
