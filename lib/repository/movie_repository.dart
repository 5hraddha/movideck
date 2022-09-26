import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/models.dart';
import './repository.dart';

class MovieRepository implements Repository {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://api.themoviedb.org/3';
  final String _apiKey = dotenv.env['TMDB_KEY'] as String;

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    final url = '$_baseUrl/movie/now_playing?api_key=$_apiKey';
    final response = await _dio.get(url);
    final movies = response.data['results'] as List;
    List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
    return movieList;
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    final url = '$_baseUrl/movie/popular?api_key=$_apiKey';
    final response = await _dio.get(url);
    final movies = response.data['results'] as List;
    List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
    return movieList;
  }

  @override
  Future<List<Movie>> getTopRatedMovies() async {
    final url = '$_baseUrl/movie/top_rated?api_key=$_apiKey';
    final response = await _dio.get(url);
    final movies = response.data['results'] as List;
    List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
    return movieList;
  }

  @override
  Future<List<Movie>> getUpcomingMovies() async {
    final url = '$_baseUrl/movie/upcoming?api_key=$_apiKey';
    final response = await _dio.get(url);
    final movies = response.data['results'] as List;
    List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
    return movieList;
  }
}
