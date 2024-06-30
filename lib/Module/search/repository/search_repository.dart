import 'package:flutter_library_book/Core/Model/base_response_network.dart';
import 'package:flutter_library_book/Core/Model/book_model.dart';
import 'package:flutter_library_book/Module/search/service/search_service.dart';
import 'package:http/http.dart' as http;

abstract class SearchUseCase {
  Future<BaseResponseNetwork<ResultGetBooksModel>> getBooks(
      {required http.Client client,
      String? topics,
      String? sort,
      String? query,
      String? languages,
      int? page = 1});
}

class SearchRepository extends SearchUseCase {
  var service = SearchService();
  @override
  Future<BaseResponseNetwork<ResultGetBooksModel>> getBooks(
      {required http.Client client,
      String? topics,
      String? sort,
      String? query,
      String? languages,
      int? page = 1}) {
    return service.getBooks(
        client: client,
        topics: topics,
        sort: sort,
        query: query,
        languages: languages);
  }
}
