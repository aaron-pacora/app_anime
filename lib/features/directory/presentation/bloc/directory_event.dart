part of 'directory_bloc.dart';

abstract class DirectoryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingDirectoryEvent extends DirectoryEvent {}
class GetDirectoryEvent extends DirectoryEvent {}