import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notti/cubits/notes_cubit.dart';
import 'package:notti/widgets/add_note_app_bar.dart';
import 'package:notti/widgets/colors_list_view.dart';
import 'package:notti/widgets/text_form_field.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final int maxNoteLength = 1000;
  String? audioPath;

  late Record audioRecord;
  late AudioPlayer audioPlayer;

  Timer? timer;
  DateTime currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    // audioRecord = Record();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
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
                  AddNoteAppBar(
                    titleController: titleController,
                    descriptionController: descriptionController,
                    formKey: _formKey,
                  ),
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
                    validator: (description) {
                      if (description == null || description.isEmpty) {
                        return "Description can't be empty";
                      }
                      return null;
                    },
                    controller: descriptionController,
                  ),
                  SizedBox(height: 32),
                  ColorsList(
                    color:
                        BlocProvider.of<NotesCubit>(context).color?.value ??
                        Color(0xFF9D4EDD).value,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
