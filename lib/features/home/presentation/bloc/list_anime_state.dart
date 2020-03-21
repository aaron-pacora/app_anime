part of 'list_anime_bloc.dart';

abstract class ListAnimeState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingListAnimeState extends ListAnimeState {}

class DataListAnimeState extends ListAnimeState {
  final ListAnimeChaptersEntity data;

  DataListAnimeState(this.data);

  @override
  List<Object> get props => [data];
}
