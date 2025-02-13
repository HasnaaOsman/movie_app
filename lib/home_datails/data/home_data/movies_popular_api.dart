
import '../../../shared/network/remote/api/end_point.dart';
import '../../../shared/service_locator.dart';
import '../models/popular_models/movies_popular.dart';
import '../models/popular_models/popular_movies.dart';
import '../models/top_rated_models/movies_top_rated.dart';
import '../models/top_rated_models/top_rated_movies.dart';
import '../models/upcoming_models/movies_upcoming.dart';
import '../models/upcoming_models/upcoming_movies.dart';
import 'movies_data.dart';

class MoviesPopularApi extends MoviesData {
  @override
  Future<List<PopularMovies>> getPopularMovies() async {
    final Uri url = Uri.http(EndPoint.baseUrl, EndPoint.popular);
    final response = await ServiceLocator.apiConsumer.get(url, headers: {
      ApiKey.authorization: ApiKey.accessToken,
      ApiKey.accept: ApiKey.applicationJson,
    });
    MoviesPopular moviesPopular = MoviesPopular.fromJson(response);
    if (moviesPopular.popularMovies != null) {
      return moviesPopular.popularMovies!;
    } else if (moviesPopular.errorServerModel?.statusMessage != null ||
        moviesPopular.errorServerModel?.success == false) {
      throw Exception(moviesPopular.errorServerModel?.statusMessage);
    } else {
      throw Exception('Failed to get Popular Movies');
    }
  }

  @override
  Future<List<UpcomingMovies>> getUpcomingMovies() async {
    final Uri url = Uri.http(EndPoint.baseUrl, EndPoint.upcoming);
    final response = await ServiceLocator.apiConsumer.get(url, headers: {
      ApiKey.authorization: ApiKey.accessToken,
      ApiKey.accept: ApiKey.applicationJson,
    });
    MoviesUpcoming moviesUpcoming = MoviesUpcoming.fromJson(response);
    if (moviesUpcoming.upcomingMovies != null) {
      return moviesUpcoming.upcomingMovies!;
    } else if (moviesUpcoming.errorServerModel?.statusMessage != null ||
        moviesUpcoming.errorServerModel?.success == false) {
      throw Exception(moviesUpcoming.errorServerModel?.statusMessage);
    } else {
      throw Exception('Failed to get Upcoming Movies');
    }
  }

  @override
  Future<List<TopRatedMovies>> getTopRatedMovies() async {
    final Uri url = Uri.http(EndPoint.baseUrl, EndPoint.topRated);
    final response = await ServiceLocator.apiConsumer.get(url, headers: {
      ApiKey.authorization: ApiKey.accessToken,
      ApiKey.accept: ApiKey.applicationJson,
    });
    MoviesTopRated moviesTopRated = MoviesTopRated.fromJson(response);
    if (moviesTopRated.topRatedMovies != null) {
      return moviesTopRated.topRatedMovies!;
    } else if (moviesTopRated.errorServerModel?.statusMessage != null ||
        moviesTopRated.errorServerModel?.success == false) {
      throw Exception(moviesTopRated.errorServerModel?.statusMessage);
    } else {
      throw Exception('Failed to get TopRated Movies');
    }
  }
}
