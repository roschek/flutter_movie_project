import 'package:first_big_app/domains/api_client/api_client.dart';
import 'package:first_big_app/library/notify_provider.dart';
import 'package:first_big_app/ui/navigation/main_navigation.dart';
import 'package:first_big_app/ui/widgets/movie_list/movie_list_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifyProvider.watch<MovieListModel>(context);
    if (model == null) return SizedBox.shrink();
    return Stack(children: [
      ListView.builder(
          padding: EdgeInsets.only(top: 50),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: model.movies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            model.addLazyLoad(index);
            final movie = model.movies[index];
            final imageUrl = movie.posterPath;
            final releaseDate = movie.releaseDate;
            return Stack(children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black.withOpacity(.2)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      )
                    ]),
                clipBehavior: Clip.hardEdge,
                child: Row(
                  children: [
                    // Image(
                    //   image: AssetImage(movie.imageName),
                    imageUrl != null
                        ? Image.network(ApiClient.baseUrl(imageUrl), width: 95)
                        : SizedBox.shrink(),
                    // ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(movie.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              releaseDate != null ? DateFormat.yMMMMd().format(releaseDate): '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            movie.overview,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => model.onMovieTap(context, index)),
              ),
            ]);
          }),
      Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
                labelText: 'Поиск',
                filled: true,
                fillColor: Colors.white.withAlpha(235),
                border: OutlineInputBorder()),
          ))
    ]);
  }
}
