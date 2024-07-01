import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_library_book/Core/Model/book_model.dart';
import 'package:flutter_library_book/Module/search/repository/search_repository.dart';
import 'package:http/http.dart' as http;
part '../state/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  int pageIndex = 1;
  List<BookModel> books = [];
  SearchRepository repository = SearchRepository();
  SearchCubit() : super(InitialSearchState());

  void getBooks(
      {required http.Client client,
      String? topics,
      String? sort,
      String? query,
      String? languages,
      int? page = 1}) async {
    try {
      emit(LoadingSearchState());
      var data = await repository.getBooks(
          client: client,
          topics: topics,
          sort: sort,
          query: query,
          languages: languages,
          page: page);
      books.addAll(data.results.results ?? []);
      var stream = Stream<List<BookModel>>.value(books);
      emit(GetStreamSearchBookState(stream: stream));
    } catch (e) {
      emit(GetFailedSearchState(message: e.toString()));
    }
  }

  void getDataBook(
      {required http.Client client,
      String? topics,
      String? sort,
      String? query,
      String? languages,
      int? page = 1}) async {
    try {
      var data = await repository.getBooks(
          client: client,
          topics: topics,
          sort: sort,
          query: query,
          languages: languages,
          page: page);
      if (data.next != null) {
        books.addAll(data.results.results ?? []);
        var stream = Stream<List<BookModel>>.value(books);
        emit(GetStreamSearchBookState(stream: stream));
      }
    } catch (e) {
      emit(GetFailedSearchState(message: e.toString()));
    }
  }
}
