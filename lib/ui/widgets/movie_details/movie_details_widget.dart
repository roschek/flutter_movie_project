
import 'package:first_big_app/library/notify_provider.dart';
import 'package:first_big_app/ui/widgets/movie_details/movie_details_sections/movie_details_model.dart';
import 'package:flutter/material.dart';

import 'movie_details_sections/movie_details_main_info.dart';
import 'movie_details_sections/movie_details_screencast_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;
  MovieDetailsWidget({Key? key, required this.movieId}) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    final model = NotifyProvider.watch<MovieDetailsModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text(model?.movieDetails?.title ?? 'Загрузка...')),
      body: MovieDetailsScreen()
    );
  }
}

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifyProvider.watch<MovieDetailsModel>(context);
    final movieDetails = model?.movieDetails;
    if(movieDetails == null){
      return Center(
          child: CircularProgressIndicator());
    }
    return ColoredBox(
        color: Color.fromRGBO(24, 23, 27, 1),
    child: ListView(
    children: [
    MovieDetailsMainInfoWidget(),
    MovieDetailsScreencastWidget()
    ],
    ));
  }
}
