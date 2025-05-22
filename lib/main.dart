import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notti/cubits/notes_cubit.dart';
import 'package:notti/models/note_model.dart';
import 'package:notti/pages/notes_page_view.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notesBox');
  // await Hive.box<NoteModel>('notesBox').clear();
  runApp(
    BlocProvider(create: (context) => NotesCubit()..init(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPageView(),
      theme: ThemeData(fontFamily: "Acme"),
    );
  }
}
