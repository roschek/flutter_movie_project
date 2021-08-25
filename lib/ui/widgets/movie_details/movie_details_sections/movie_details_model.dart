import 'package:first_big_app/domains/api_client/api_client.dart';
import 'package:first_big_app/utility/movie_details.dart';
import 'package:flutter/material.dart';

class MovieDetailsModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final int movieId;
  MovieDetails? _movieDetails;

  MovieDetails? get movieDetails => _movieDetails;


  MovieDetailsModel(this.movieId);
  Future<void> loadDetails() async {
    _movieDetails = await _apiClient.movieDetails(movieId);
    notifyListeners();
}
}