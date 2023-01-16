import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:notes_repository/notes_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'note_event.dart';
part 'note_state.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

const int _limitNotes = 20;

const throttleDuration = Duration(milliseconds: 100);

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(const NoteState()) {
    on<NoteFetched>(
      _onNoteFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onNoteFetched(
      NoteFetched event, Emitter<NoteState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == NoteStatus.initial) {
        print('try');
        final notes = await NotesRepository.fetchNotes(0, _limitNotes);
        return emit(state.copyWith(
          status: NoteStatus.success,
          notes: List.of(state.notes)..addAll(notes),
          hasReachedMax: false,
        ));
      }
      final notes = await NotesRepository.fetchNotes(state.notes.length, _limitNotes);
      emit(notes.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
        status: NoteStatus.success,
        notes: List.of(state.notes)..addAll(notes),
        hasReachedMax: false,
      ));
    } catch (_) {
      print('error in bloc');
      emit(state.copyWith(status: NoteStatus.failure));
    }
  }
}
