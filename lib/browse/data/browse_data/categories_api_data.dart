
import '../../../shared/network/remote/api/end_point.dart';
import '../../../shared/service_locator.dart';
import '../models/category_model.dart';
import '../models/genres_movies.dart';
import 'browse_data.dart';

class CategoriesApiData extends BrowseData {
  @override
  Future<List<Genres>> getCategory() async {
    final Uri url = Uri.http(EndPoint.baseUrl, EndPoint.categoriesList);
    final response = await ServiceLocator.apiConsumer.get(url, headers: {
      ApiKey.authorization: ApiKey.accessToken,
      ApiKey.accept: ApiKey.applicationJson,
    });
    CategoryModel categoryModel = CategoryModel.fromJson(response);
    if (categoryModel.genres != null) {
      return categoryModel.genres!;
    } else if (categoryModel.errorServerModel?.statusMessage != null ||
        categoryModel.errorServerModel?.success == false) {
      throw Exception(categoryModel.errorServerModel?.statusMessage);
    } else {
      throw Exception('Failed to get Category of Movies');
    }
  }
}
