import 'dart:async';

import 'package:first_big_app/domains/api_client/api_client.dart';
import 'package:first_big_app/ui/navigation/main_navigation.dart';
import 'package:first_big_app/utility/movie.dart';
import 'package:first_big_app/utility/popular_movie_response.dart';
import 'package:flutter/material.dart';

class MovieListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _movies = <Movie>[];
  late int _currentPage = 0;
  late int _totalPage = 1;
  var _isLoadingProgress = false;
  String? _searchQuery;
  Timer? _searchDebounce;
  List<Movie> get movies => List.unmodifiable(_movies);

  Future<PopularMovieResponse> _loadMovies(int nextPage) async {
    final query = _searchQuery;
    if (query == null) {
      return await _apiClient.takePopularMovies(nextPage);
    } else {
      return await _apiClient.searchMovies(nextPage, query);
    }
  }

  Future<void> loadNextPage() async {
    if (_isLoadingProgress || _currentPage >= _totalPage) return;
    _isLoadingProgress = true;
    final nextPage = _currentPage + 1;
    try {
      final moviesResponse = await _loadMovies(nextPage);
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

  Future<void> searchMovie(String text) async {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 300), () async {
      final searchQuery = text.isNotEmpty ? text : null;
      if (searchQuery == _searchQuery) return;
      _searchQuery = searchQuery;
      await _resetList();
    });
  }

  void addLazyLoad(int index) {
    if (index < _movies.length - 2) return;
    loadNextPage();
  }

  Future<void> _resetList() async {
    _currentPage = 0;
    _totalPage = 1;
    _movies.clear();
    await loadNextPage();
  }
}
