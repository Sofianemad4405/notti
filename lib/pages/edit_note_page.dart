import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notti/cubits/notes_cubit.dart';
import 'package:notti/models/note_model.dart';
import 'package:notti/widgets/app_bar_icon.dart';
import 'package:notti/widgets/colors_list_view.dart';
import 'package:notti/widgets/text_form_field.dart';

class EditNotePage extends StatefulWidget {
  const EditNotePage({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    titleController.text = widget.note.title;
    descriptionController.text = widget.note.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppBarIcon(
                        icon: Icons.arrow_back_ios,
                        onPressed: () => Navigator.pop(context),
                      ),
                      AppBarIcon(
                        icon: Icons.check,
                        onPressed: () {
                          try {
                            if (_formKey.currentState!.validate()) {
                              widget.note.title = titleController.text;
                              widget.note.content = descriptionController.text;
                              widget.note.color =
                                  BlocProvider.of<NotesCubit>(
                                    context,
                                  ).color?.value ??
                                  0xFF9D4EDD;
                              widget.note.save();
                              BlocProvider.of<NotesCubit>(context).getNotes();
                              Navigator.pop(context);
                              log("Success Sofian");
                            }
                          } catch (e) {
                            log(e.toString());
                            rethrow;
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    controller: titleController,
                    validator: (title) {
                      if (title == null || title.isEmpty) {
                        return "Title can't be empty";
                      }
                      return null;
                    },
                    isTitle: true,
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    controller: descriptionController,
                    validator: (description) {
                      if (description == null || description.isEmpty) {
                        return "Description can't be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  ColorsList(color: widget.note.color),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
