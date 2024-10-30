
import '../../../shared/network/remote/api/end_point.dart';
import '../../../shared/service_locator.dart';
import '../models/movies_category.dart';
import '../models/movies_items.dart';
import 'movies_category_details_data.dart';

class MoviesCategoriesApiData extends MoviesCategoryDetailsData {
  @override
  Future<List<MoviesItems>> getMoviesCategoryDetails(
      String categoryId, int page) async {
    final Uri url = Uri.http(EndPoint.baseUrl, EndPoint.moviesList, {
      "with_genres": categoryId,
      'page': page.toString(),
    });
    if (page <= 500) {
      final response = await ServiceLocator.apiConsumer.get(url, headers: {
        ApiKey.authorization: ApiKey.accessToken,
        ApiKey.accept: ApiKey.applicationJson,
      });
      MoviesCategory moviesCategory = MoviesCategory.fromJson(response);
      if (moviesCategory.moviesItems != null) {
        return moviesCategory.moviesItems!;
      } else if (moviesCategory.errorServerModel?.statusMessage != null ||
          moviesCategory.errorServerModel?.success == false) {
        throw Exception(moviesCategory.errorServerModel?.statusMessage);
      } else {
        throw Exception('Failed to get Movies of this category');
      }
    } else {
      throw Exception('Failed to get Movies of this category');
    }
  }
}
