part of 'note_bloc.dart';

@immutable
abstract class NoteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NoteFetched extends NoteEvent {}
