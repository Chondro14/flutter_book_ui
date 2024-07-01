import 'package:flutter_library_book/Core/Model/base_response_network.dart';
import 'package:flutter_library_book/Core/Model/book_model.dart';
import 'package:flutter_library_book/Module/home/service/home_service.dart';
import 'package:http/http.dart' as http;

abstract class HomeUseCase {
  Future<BaseResponseNetwork<ResultGetBooksModel>> getBooks(
      {required http.Client client,
      String? topics,
      String? sort,
      String? query,
      String? languages,
      int? page = 1});
}

class HomeRepository extends HomeUseCase {
  var service = HomeService();
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
        query: query,
        topics: topics,
        sort: sort,
        languages: languages,
        page: page);
  }
}
