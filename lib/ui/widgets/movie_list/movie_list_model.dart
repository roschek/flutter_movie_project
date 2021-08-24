import 'package:first_big_app/domains/api_client/api_client.dart';
import 'package:first_big_app/ui/navigation/main_navigation.dart';
import 'package:first_big_app/utility/movie.dart';
import 'package:flutter/material.dart';

class MovieListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _movies = <Movie>[];
  late int _currentPage = 0;
  late int _totalPage = 1;
  var _isLoadingProgress = false;
  List<Movie> get movies => List.unmodifiable(_movies);

  Future<void> loadMovies() async {
    if (_isLoadingProgress || _currentPage >= _totalPage) return;
    _isLoadingProgress = true;
    final nextPage = _currentPage + 1;
    try {
      final moviesResponse = await _apiClient.takePopularMovies(nextPage);
      _currentPage = moviesResponse.page;
      _totalPage = moviesResponse.totalPages;
      _movies.addAll(moviesResponse.results);
      _isLoadingProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingProgress = false;
    }
  }

  void onMovieTap(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  }

  void addLazyLoad(int index) {
    if (index < _movies.length - 2) return;
    loadMovies();
  }
}
