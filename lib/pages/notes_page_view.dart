import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notti/cubits/notes_cubit.dart';
import 'package:notti/cubits/notes_states.dart';
import 'package:notti/pages/add_note_page.dart';
import 'package:notti/widgets/no_notes_yet.dart';
import 'package:notti/widgets/add_note_button.dart';
import 'package:notti/widgets/notes_list_view.dart';

class NotesPageView extends StatelessWidget {
  const NotesPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff000000),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: BlocBuilder<NotesCubit, NotesStates>(
            builder: (context, state) {
              if (state is NotesInitialState) {
                return NoNotesYet();
              } else if (state is NotesLoadedState) {
                final notesList = state.notes.values.toList();
                return notesList.isNotEmpty
                    ? NotesListView(notesList: notesList)
                    : NoNotesYet();
              } else if (state is NotesLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is NotesErrorState) {
                return Center(child: Text(state.error));
              } else {
                return Text("Error");
              }
            },
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: AddNoteButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AddNotePage();
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
