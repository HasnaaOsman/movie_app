
import '../models/popular_models/popular_movies.dart';
import '../models/top_rated_models/top_rated_movies.dart';
import '../models/upcoming_models/upcoming_movies.dart';

abstract class MoviesData {
  Future<List<PopularMovies>> getPopularMovies();

  Future<List<UpcomingMovies>> getUpcomingMovies();

  Future<List<TopRatedMovies>> getTopRatedMovies();
}
