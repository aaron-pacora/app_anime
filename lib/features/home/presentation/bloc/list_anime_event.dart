part of 'list_anime_bloc.dart';

abstract class ListAnimeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingListAnimeEvent extends ListAnimeEvent {}
class GetListAnimeEvent extends ListAnimeEvent {}