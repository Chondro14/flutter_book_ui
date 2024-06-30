import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_library_book/Core/Model/book_model.dart';
import 'package:flutter_library_book/Module/home/repository/home_repository.dart';
import 'package:http/http.dart' as http;

part '../state/popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  int pageIndex = 1;
  List<BookModel> books = [];
  HomeRepository repository = HomeRepository();
  PopularCubit() : super(InitialPopularState());

  void getBooks(
      {required http.Client client,
      String? topics,
      String? sort,
      String? query,
      String? languages,
      int? page = 1}) async {
    try {
      emit(LoadingPopularState());
      var data = await repository.getBooks(
          client: client,
          topics: topics,
          sort: sort,
          query: query,
          languages: languages,
          page: page);
      books.addAll(data.results.results ?? []);
      var stream = Stream<List<BookModel>>.value(books);
      emit(GetSuccessBookHomeState(stream: stream));
    } catch (e) {
      emit(GetFailedBookHomeState(message: e.toString()));
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
      books.addAll(data.results.results ?? []);
      var stream = Stream<List<BookModel>>.value(books);
      emit(GetSuccessBookHomeState(stream: stream));
    } catch (e) {
      emit(GetFailedBookHomeState(message: e.toString()));
    }
  }
}
