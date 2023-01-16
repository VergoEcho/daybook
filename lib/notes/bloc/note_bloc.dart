import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:notes_repository/notes_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:stream_transform/stream_transform.dart';

part 'note_event.dart';
part 'note_state.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteState()) {
    on<NoteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
