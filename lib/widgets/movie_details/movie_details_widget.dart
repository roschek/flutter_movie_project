import 'package:first_big_app/widgets/movie_list/movie_details_sections/movie_details_main_info.dart';
import 'package:flutter/material.dart';

import 'movie_details_sections/movie_details_main_info.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;
  MovieDetailsWidget({Key? key, required this.movieId}) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dune')),
      body: ColoredBox(
          color: Color.fromRGBO(24, 23, 27, 1),
          child: ListView(
            children: [
              MovieDetailsMainInfoWidget(),
            ],
          )),
    );
  }
}
