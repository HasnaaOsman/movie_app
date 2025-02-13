
import '../../../shared/Exceptions/Error_Server_Model/error_server_model.dart';
import '../../../shared/network/remote/api/end_point.dart';
import 'movies_items.dart';

class MoviesCategory {
  int? page;
  List<MoviesItems>? moviesItems;
  int? totalPages;
  int? totalResults;
  ErrorServerModel? errorServerModel;

  MoviesCategory({
    this.page,
    this.moviesItems,
    this.totalPages,
    this.totalResults,
    this.errorServerModel,
  });

  factory MoviesCategory.fromJson(Map<String, dynamic> json) => MoviesCategory(
        page: json[ApiKey.page] as int?,
        moviesItems: json[ApiKey.results] == null
            ? null
            : (json[ApiKey.results] as List<dynamic>?)
                ?.map((e) => MoviesItems.fromJson(e as Map<String, dynamic>))
                .toList(),
        totalPages: json[ApiKey.totalPages] as int?,
        totalResults: json[ApiKey.totalResults] as int?,
        errorServerModel: ErrorServerModel.fromJson(json),
      );
}
