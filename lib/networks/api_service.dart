import 'dart:convert';

import 'package:http/http.dart' as Http;
import 'package:movie_db/models/movie.dart';
import 'package:movie_db/models/genres.dart';
import 'package:movie_db/models/movie_detail.dart';
import 'package:movie_db/utils/constants.dart';

class ApiService {
  /// get popular movie data from the movie db api
  Future<List<Movie>> getPopularMovies() async {
    var response = await Http.get(Uri.parse('${Constants.BASE_URL}/movie/popular?api_key=${Constants.API_KEY}'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['results'];
      List<Movie> movies = body.map((item) => Movie.fromJson(item)).toList();
      return movies;
    } else {
      throw Exception('Failed to load data.');
    }
  }

  /// get movie detail by [movieId]
  Future<MovieDetail> getMovieDetails(int movieId) async {
    // Todo: implement logic here
    throw UnimplementedError('Not implemented');
  }

  /// search movie by [movieName]
  Future<List<Movie>> searchMovies(String movieName) async {
    var response = await Http.get(Uri.parse('${Constants.BASE_URL}/search/movie?api_key=${Constants.API_KEY}&query=$movieName'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['results'];
      List<Movie> movies = body.map((item) => Movie.fromJson(item)).toList();
      return movies;
    } else {
      throw Exception('Failed to load data.');
    }
  }

  /// get movies genres list
  Future<List<Genre>> getMovieGenres() async {
    var response = await Http.get(Uri.parse('${Constants.BASE_URL}/genre/movie/list?api_key=${Constants.API_KEY}'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['genres'];
      List<Genre> genres = body.map((item) => Genre.fromJson(item)).toList();
      return genres;
    } else {
      throw Exception('Failed to load data.');
    }
  }
}
