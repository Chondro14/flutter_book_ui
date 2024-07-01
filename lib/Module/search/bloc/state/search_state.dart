part of '../cubit/search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialSearchState extends SearchState {}

class LoadingSearchState extends SearchState {}

class GetStreamSearchBookState extends SearchState {
  final Stream<List<BookModel>> stream;
  const GetStreamSearchBookState({required this.stream});
  @override
  // TODO: implement props
  List<Object?> get props => [stream];
}

class GetFailedSearchState extends SearchState {
  final String message;
  const GetFailedSearchState({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
