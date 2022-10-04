import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business_logic/models/models.dart';
import './web_api.dart';

class WebApiImplementation implements WebApi {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://api.themoviedb.org/3';
  final String _apiKey = dotenv.env['TMDB_KEY'] as String;

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    final url = '$_baseUrl/movie/now_playing?api_key=$_apiKey';
    final response = await _dio.get(url);
    final movies = response.data['results'] as List;
    final List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
    return movieList;
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    final url = '$_baseUrl/movie/popular?api_key=$_apiKey';
    final response = await _dio.get(url);
    final movies = response.data['results'] as List;
    final List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
    return movieList;
  }

  @override
  Future<List<Movie>> getTopRatedMovies() async {
    final url = '$_baseUrl/movie/top_rated?api_key=$_apiKey';
    final response = await _dio.get(url);
    final movies = response.data['results'] as List;
    final List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
    return movieList;
  }

  @override
  Future<List<Movie>> getUpcomingMovies() async {
    final url = '$_baseUrl/movie/upcoming?api_key=$_apiKey';
    final response = await _dio.get(url);
    final movies = response.data['results'] as List;
    final List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
    return movieList;
  }

  @override
  Future<MovieDetail> getMovieDetail(int movieId) async {
    final url = '$_baseUrl/movie/$movieId?api_key=$_apiKey';
    final response = await _dio.get(url);
    final MovieDetail movieDetail = MovieDetail.fromJson(response.data);
    return movieDetail;
  }
}

//Web Api service provider
final webApiProvider = Provider<WebApi>((ref) => WebApiImplementation());
