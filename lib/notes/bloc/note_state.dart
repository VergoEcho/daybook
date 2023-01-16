part of 'note_bloc.dart';

enum NoteStatus {initial, success, failure}

class NoteState extends Equatable {
  final NoteStatus status;
  final List<Note> notes;
  final bool hasReachedMax;

  NoteState({this.status = NoteStatus.initial, this.notes = <Note>[], this.hasReachedMax = false,});

  @override
  // TODO: implement props
  List<Object?> get props => [status, notes, hasReachedMax];
}