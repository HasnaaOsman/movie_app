
import '../models/search_result.dart';

abstract class SearchData {
  Future<List<SearchResult>> getSearchMovies(String query, int page);
}
