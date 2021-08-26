import 'package:json_annotation/json_annotation.dart';
import 'movie.dart';

part 'popular_movie_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PopularMovieResponse {
  final int page;
  final List<Movie> results;
  final int totalResults;
  final int totalPages;

  PopularMovieResponse({
    required this.page,
    required this.results,
    required this.totalResults,
    required this.totalPages,
});

  factory PopularMovieResponse.fromJson(Map<String, dynamic> json) =>_$PopularMovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMovieResponseToJson(this);
}