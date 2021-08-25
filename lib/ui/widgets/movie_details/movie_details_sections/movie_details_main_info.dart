import 'package:first_big_app/domains/api_client/api_client.dart';
import 'package:first_big_app/library/notify_provider.dart';
import 'package:first_big_app/utility/movie_details_cast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'movie_details_model.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifyProvider.watch<MovieDetailsModel>(context);
    final description = model?.movieDetails?.overview;
    var crew = model?.movieDetails?.credits.crew;
    if (crew ==null || crew.isEmpty) return SizedBox.shrink();
    //crew = crew.length >4 ? crew.sublist(0, 3) : crew;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _TopPosterWidget(),
      SizedBox(height: 10),
      _TitleWidget(),
      ButtonsWidget(),
      Padding(
          padding: EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 30),
          child: _SummaryWidget()),
      Text('Описание', style: TextStyle(color: Colors.white)),
      SizedBox(height: 10),
            Text(description!, style: TextStyle(color: Colors.white)),
      SizedBox(height: 20),
      Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                crew[0].name != null ? Text(crew[0].name, style: TextStyle(color: Colors.white)) : SizedBox.shrink(),
                crew[0].job != null ? Text(crew[0].job, style: TextStyle(color: Colors.white)) : SizedBox.shrink()
              ],
            ),
            Column(
              children: [
                crew[1].name != null ? Text(crew[1].name, style: TextStyle(color: Colors.white)) : SizedBox.shrink(),
                crew[1].job != null ? Text(crew[1].job, style: TextStyle(color: Colors.white)) : SizedBox.shrink()
              ],
            )
          ]),
      SizedBox(height: 20),
      Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                crew[2].name != null ? Text(crew[2].name, style: TextStyle(color: Colors.white)) : SizedBox.shrink(),
                crew[2].job != null ? Text(crew[2].job, style: TextStyle(color: Colors.white)) : SizedBox.shrink()
              ],
            ),
            Column(
              children: [
                crew[3].name != null ? Text(crew[3].name, style: TextStyle(color: Colors.white)) : SizedBox.shrink(),
                crew[3].job != null ? Text(crew[3].job, style: TextStyle(color: Colors.white)) : SizedBox.shrink()
              ],
            )
          ])
    ]);
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifyProvider.watch<MovieDetailsModel>(context);
    final backdropPath = model?.movieDetails?.backdropPath;
    final posterPath = model?.movieDetails?.posterPath;
    return Stack(
      children: [
        backdropPath != null
            ? Image.network(ApiClient.baseUrl(backdropPath))
            : SizedBox.shrink(),
        Positioned(
          top: 10,
          left: 10,
          bottom: 10,
          child: posterPath != null
              ? Image.network(ApiClient.baseUrl(posterPath))
              : SizedBox.shrink(),
        )
      ],
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifyProvider.watch<MovieDetailsModel>(context);
    final title = model?.movieDetails?.title;
    final releaseDate = model?.movieDetails?.releaseDate;
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          title != null
              ? Text(title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white))
              : SizedBox.shrink(),
          SizedBox(width: 30),
          releaseDate != null
              ? Text(DateFormat.yMMMMd().format(releaseDate),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey))
              : SizedBox.shrink(),
        ]);
  }
}

class _SummaryWidget extends StatelessWidget {
  const _SummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifyProvider.watch<MovieDetailsModel>(context);
    final tagline = model?.movieDetails?.tagline;
    return tagline != null
        ? Text(tagline,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18))
        : Text('Смотрите на торрентах!',
            style: TextStyle(color: Colors.white, fontSize: 18));
  }
}

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifyProvider.watch<MovieDetailsModel>(context);
    final votesCount = model?.movieDetails?.voteCount;
    final videoLink = model?.movieDetails?.imdbId;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () {},
            child: Text('рейтинг: $votesCount голосов',
                style: TextStyle(color: Colors.white))),
        Container(width: 1, height: 15, color: Colors.grey),
        TextButton(
            onPressed: () {},
            child: Row(children: [
              Icon(Icons.play_arrow),
              Text('Посмотреть трейлер', style: TextStyle(color: Colors.white))
            ]))
      ],
    );
  }
}
