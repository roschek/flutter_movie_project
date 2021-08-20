import 'package:first_big_app/widgets/main_screen/main_screen_widget.dart';
import 'package:first_big_app/widgets/services/custom_images.dart';
import 'package:flutter/material.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie(
      {
      required this.id,
      required this.imageName,
      required this.title,
      required this.time,
      required this.description});
}

class MovieListWidget extends StatefulWidget {
  MovieListWidget({Key? key}) : super(key: key);

  @override
  _MovieListWidgetState createState() => _MovieListWidgetState();
}


class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
        id:1,
        imageName: AppImages.cardImage,
        title: 'Mortal Combat',
        time: 'April 7, 2021',
        description: 'Some good film for all'),
    Movie(
        id:2,
        imageName: AppImages.cardImage,
        title: 'Dune',
        time: 'April 7, 2021',
        description: 'Some good film for all'),
    Movie(
        id:3,
        imageName: AppImages.cardImage,
        title: 'Star Wars',
        time: 'April 7, 2021',
        description: 'Some good film for all'),
    Movie(
        id:4,
        imageName: AppImages.cardImage,
        title: 'Armageddon',
        time: 'April 7, 2021',
        description: 'Some good film for all'),
    Movie(
        id: 5,
        imageName: AppImages.cardImage,
        title: 'Aliens',
        time: 'April 7, 2021',
        description: 'Some good film for all'),
    Movie(
        id: 6,
        imageName: AppImages.cardImage,
        title: 'Some new good film',
        time: 'April 7, 2021',
        description: 'Some good film for all')
  ];
  var _filteredMovies = <Movie>[];
  final _searchController = TextEditingController();

  void _searchMovie() {
    final query = _searchController.text;
    if(query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovie);
  }
  void _onMovieTap(int index) {
    final id  = _movies[index].id;
      Navigator.of(context).pushNamed('/main/movie_details', arguments: id);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView.builder(
          padding: EdgeInsets.only(top: 50),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredMovies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final movie = _filteredMovies[index];
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
                    Image(
                      image: AssetImage(movie.imageName),
                    ),
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
                          Text(movie.time,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            movie.description,
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
                  onTap: () => _onMovieTap(index)
                ),
              ),
            ]);
          }),
      Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
                labelText: 'Поиск',
                filled: true,
                fillColor: Colors.white.withAlpha(235),
                border: OutlineInputBorder()),
          ))
    ]);
  }
}
