import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  String? voiceNotePath;
  @HiveField(3)
  int? id;
  @HiveField(4)
  String date;
  @HiveField(5)
  int color;
  NoteModel({
    required this.date,
    this.id,
    required this.title,
    this.voiceNotePath,
    required this.content,
    required this.color,
  });
}
