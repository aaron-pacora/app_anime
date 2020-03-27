part of 'directory_bloc.dart';

abstract class DirectoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingDirectoryState extends DirectoryState {}

class DataDirectoryState extends DirectoryState {
  final DirectoryEntity data;

  DataDirectoryState(this.data);

  @override
  List<Object> get props => [data];
}
