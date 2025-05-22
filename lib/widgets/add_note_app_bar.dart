import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notti/cubits/notes_cubit.dart';
import 'package:notti/models/note_model.dart';
import 'package:notti/widgets/app_bar_icon.dart';

class AddNoteAppBar extends StatefulWidget {
  const AddNoteAppBar({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.formKey,
  });
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey;

  @override
  State<AddNoteAppBar> createState() => _AddNoteAppBarState();
}

class _AddNoteAppBarState extends State<AddNoteAppBar> {
  DateTime currentTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppBarIcon(
          icon: Icons.arrow_back_ios,
          onPressed: () => Navigator.pop(context),
        ),
        Expanded(
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${currentTime.day.toString().padLeft(2, '0')}/"
                  "${currentTime.month.toString().padLeft(2, '0')}/"
                  "${currentTime.year}",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 8),
                Text(
                  "${DateTime.now().hour.toString().padLeft(2, '0')}:"
                  "${DateTime.now().minute.toString().padLeft(2, '0')}:"
                  "${DateTime.now().second.toString().padLeft(2, '0')}",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        AppBarIcon(
          icon: Icons.check,
          onPressed: () {
            if (widget.formKey.currentState!.validate()) {
              try {
                widget.formKey.currentState!.save();
                String date =
                    "${currentTime.day.toString().padLeft(2, '0')}/"
                    "${currentTime.month.toString().padLeft(2, '0')}/"
                    "${currentTime.year}";
                NoteModel noteModel = NoteModel(
                  color:
                      BlocProvider.of<NotesCubit>(context).color?.value ??
                      Color(0xFF9D4EDD).value,
                  date: date,
                  id:
                      BlocProvider.of<NotesCubit>(
                        context,
                      ).getNotes().values.length,
                  title: widget.titleController.text,
                  content: widget.descriptionController.text,
                );
                BlocProvider.of<NotesCubit>(context).addNote(noteModel);
                BlocProvider.of<NotesCubit>(context).getNotes();
                Navigator.pop(context);
                BlocProvider.of<NotesCubit>(context).color = Color(0xFF9D4EDD);
              } catch (e) {
                return;
              }
            }
          },
        ),
      ],
    );
  }
}
