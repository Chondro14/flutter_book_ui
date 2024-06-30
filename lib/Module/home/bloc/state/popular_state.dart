part of '../cubit/popular_cubit.dart';

abstract class PopularState extends Equatable {
  const PopularState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialPopularState extends PopularState {}

class LoadingPopularState extends PopularState {}

class GetSuccessBookHomeState extends PopularState {
  final Stream<List<BookModel>> stream;
  const GetSuccessBookHomeState({required this.stream});

  @override
  // TODO: implement props
  List<Object?> get props => [stream];
}

class GetFailedBookHomeState extends PopularState {
  final String message;
  const GetFailedBookHomeState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
