part of 'note_bloc.dart';

enum NoteStatus { initial, success, failure }

class NoteState extends Equatable {
  final NoteStatus status;
  final List<Note> notes;
  final bool hasReachedMax;

  const NoteState({
    this.status = NoteStatus.initial,
    this.notes = const <Note>[],
    this.hasReachedMax = false,
  });

  NoteState copyWith({
    NoteStatus? status,
    List<Note>? notes,
    bool? hasReachedMax,
  }) {
    return NoteState(
        status: status ?? this.status,
        notes: notes ?? this.notes,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  String toString() {
    return '''NoteState { status: $status, hasReachedMax: $hasReachedMax, notes: ${notes.length} }''';
  }

  @override
  List<Object?> get props => [status, notes, hasReachedMax];
}
