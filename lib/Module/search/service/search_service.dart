import 'dart:convert';

import 'package:flutter_library_book/Core/Helper/api_url.dart';
import 'package:flutter_library_book/Core/Model/base_response_network.dart';
import 'package:flutter_library_book/Core/Model/book_model.dart';
import 'package:http/http.dart' as http;

class SearchService {
  Future<BaseResponseNetwork<ResultGetBooksModel>> getBooks(
      {required http.Client client,
      String? topics,
      String? sort,
      String? query,
      String? languages,
      int? page = 1}) async {
    var url = urlQuery(topics, sort, query, languages, page);
    print(url);
    var response = await client.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        var data = BaseResponseNetwork<ResultGetBooksModel>.fromJson(
            jsonDecode(response.body), ResultGetBooksModel.fromJson);
        return data;
      } else if (response.statusCode == 401) {
        throw "Error Authorized";
      } else {
        throw "Error handling service";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  String urlQuery(String? topics, String? sort, String? query,
      String? languages, int? page) {
    if (topics == null && sort == null && query == null && languages == null) {
      return "$apiUrl/books/?page=${page ?? 1}";
    } else if (topics == null && sort == null && languages == null) {
      return "$apiUrl/books/?page=${page ?? 1}&search=${query ?? ""}";
    } else if (query == null && sort == null && languages == null) {
      return "$apiUrl/books/?page=${page ?? 1}&topic=${query ?? ""}";
    } else if (query == null && topics == null && languages == null) {
      return "$apiUrl/books/?page=${page ?? 1}&sort=${sort ?? ""}";
    } else if (query == null && topics == null && sort == null) {
      return "$apiUrl/books/?page=${page ?? 1}&languages=${languages ?? ""}";
    } else if (sort == null && topics == null) {
      return "$apiUrl/books/?page=${page ?? 1}&search=${query ?? ""}&topic=${topics ?? ""}";
    } else if (topics == null && languages == null) {
      return "$apiUrl/books/?page=${page ?? 1}&search=${query ?? ""}&sort=${sort ?? ""}";
    } else if (sort == null && query == null) {
      return "$apiUrl/books/?page=${page ?? 1}&languages=${languages ?? ""}&topic=${topics ?? ""}";
    } else if (topics == null && query == null) {
      return "$apiUrl/books/?page=${page ?? 1}&languages=${languages ?? ""}&sort=${sort ?? ""}";
    } else if (query == null) {
      return "$apiUrl/books/?page=${page ?? 1}&topic=${topics ?? ""}&sort=${sort ?? ""}&languages=${languages ?? ""}";
    } else if (sort == null) {
      return "$apiUrl/books/?page=${page ?? 1}&search=$query&topic=${topics ?? ""}&languages=${languages ?? ""}";
    } else if (topics == null) {
      return "$apiUrl/books/?page=${page ?? 1}&search=$query&sort=$sort&languages=${languages ?? ""}";
    } else if (languages == null) {
      return "$apiUrl/books/?page=${page ?? 1}&search=$query&topic=$topics&sort=$sort";
    } else {
      return "$apiUrl/books/?page=${page ?? 1}&search=$query&topic=$topics&sort=$sort&languages=$languages";
    }
  }
}
