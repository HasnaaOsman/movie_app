
import '../models/movie_details_response/genre.dart';
import '../models/similar_response/similarMovies.dart';

abstract class MoviesDataDetails {
  Future<List<Genre>> getMovieDetails(int movieId);

  Future<List<SimilarMovies>> getSimilarMovies(int movieId);
}
