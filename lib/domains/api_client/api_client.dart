import 'dart:io';
import 'dart:convert';

import 'package:first_big_app/utility/popular_movie_response.dart';

class ApiClient {
  final _client = HttpClient();
  static const _host = 'https://api.themoviedb.org/3';
  static const _imageUrl = 'https://image.tmdb.org/t/p/w500';
  static const _apiKey = '0a2a46b5593a0978cc8e87ba34037430';

  static String baseUrl(String path) => _imageUrl + path;

  Future<String> auth({
    required String userName,
    required String password,
  }) async {
    final token = await _makeToken();
    final validToken = await _validateUser(
        userName: userName, password: password, requestToken: token);
    final sessionId = await _makeSession(requestToken: validToken);
    return sessionId;
  }

  Future<String> _makeToken() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/authentication/token/new?api_key=$_apiKey');
    final request = await _client.getUrl(url);
    final response = await request.close();
    final json = await response.jsonDecode() as Map<String, dynamic>;
    final token = json['request_token'] as String;
    return token;
  }

  Future<String> _validateUser(
      {required String userName,
      required String password,
      required String requestToken}) async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=$_apiKey');
    final parameters = <String, dynamic>{
      'username': userName,
      'password': password,
      'request_token': requestToken
    };
    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    final response = await request.close();
    final json = await response.jsonDecode() as Map<String, dynamic>;
    final token = json['request_token'] as String;
    return token;
  }

  Future<String> _makeSession({required String requestToken}) async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/authentication/session/new?api_key=$_apiKey');
    final parameters = <String, dynamic>{'request_token': requestToken};
    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    final response = await request.close();
    final json = await response.jsonDecode() as Map<String, dynamic>;
    final sessionId = json['session_id'] as String;
    return sessionId;
  }

  Future<PopularMovieResponse> takePopularMovies(int page) async {
    final currentPage = page.toString();
    final url = Uri.parse('$_host/movie/popular?api_key=$_apiKey&language=ru-RU&page=$currentPage');
    final request = await _client.getUrl(url);
    final response = await request.close();
    final json = await response.jsonDecode() as Map<String, dynamic>;
    final jsonMap = json;
    final result = PopularMovieResponse.fromJson(jsonMap);

    return result;
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((value) => json.decode(value));
  }
}
