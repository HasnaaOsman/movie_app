
import '../models/genres_movies.dart';

abstract class BrowseData {
  Future<List<Genres>> getCategory();
}
