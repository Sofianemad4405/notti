import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notti/cubits/notes_cubit.dart';
import 'package:notti/models/note_model.dart';
import 'package:notti/pages/edit_note_page.dart';
import 'package:notti/widgets/notes_page_app_bar.dart';
import 'package:notti/widgets/note_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key, required this.notesList});
  final List<NoteModel> notesList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNotesPageAppBar(),
          Text(
            "${BlocProvider.of<NotesCubit>(context).getNotes().length} ${BlocProvider.of<NotesCubit>(context).getNotes().length == 1 ? 'note' : 'notes'}",
            style: TextStyle(color: Colors.white60, fontSize: 24),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ListView.builder(
                physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemCount: notesList.length,
                itemBuilder: (context, index) {
                  NoteModel note = notesList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: NoteCard(
                      note: note,
                      onTap: () {
                        Navigator.push(
                          context,  
                          MaterialPageRoute(
                            builder: (context) {
                              return EditNotePage(note: note);
                            },
                          ),
                        );
                      },
                      onDelete: () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder:
                              (context) => AlertDialog(
                                title: Text('Delete Note'),
                                content: Text(
                                  'Are you sure you want to delete this note?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed:
                                        () => Navigator.of(context).pop(false),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed:
                                        () => Navigator.of(context).pop(true),
                                    child: Text(
                                      'Delete',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                        );
                        if (confirm == true) {
                          note.delete();
                          BlocProvider.of<NotesCubit>(context).getNotes();
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
