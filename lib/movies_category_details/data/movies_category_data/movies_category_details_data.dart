
import '../models/movies_items.dart';

abstract class MoviesCategoryDetailsData {
  Future<List<MoviesItems>> getMoviesCategoryDetails(String categoryId,int page);
}
