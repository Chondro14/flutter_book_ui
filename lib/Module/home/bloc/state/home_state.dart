part of '../cubit/home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class GetSuccessBookHomeState extends HomeState {
  final Stream<List<BookModel>> stream;
  const GetSuccessBookHomeState({required this.stream});

  @override
  // TODO: implement props
  List<Object?> get props => [stream];
}

class GetFailedBookHomeState extends HomeState {
  final String message;
  const GetFailedBookHomeState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
