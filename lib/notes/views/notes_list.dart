import 'package:daybook/notes/bloc/note_bloc.dart';
import 'package:daybook/notes/widgets/bottom_loader.dart';
import 'package:daybook/notes/widgets/notes_note_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(builder: (context, state) {
      switch (state.status) {
        case NoteStatus.failure:
          return const Center(
            child: Text('Failed to fetch posts'),
          );
        case NoteStatus.success:
          if (state.notes.isEmpty) {
            return const Center(
              child: Text('No notes...'),
            );
          }
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              print(index);
              print('state ${index >= state.notes.length}');
              return index >= state.notes.length
                  ? const BottomLoader()
                  : NotesNoteTile(
                title: state.notes[index].title,
                description: state.notes[index].body,
                key:
                Key(state.notes[index].id.toString()),
              );
            },
            itemCount: state.hasReachedMax
                ? state.notes.length
                : state.notes.length + 1,
            // controller: _scrollController,
          );
        case NoteStatus.initial:
          return const Center(
            child: CircularProgressIndicator(),
          );
      }
    });
  }
}
