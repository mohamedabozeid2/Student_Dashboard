import 'package:equatable/equatable.dart';

class Announcement extends Equatable {
  final int id;
  final String announcer;
  final String subject;
  final String announcerPhoto;
  final String announcementBody;
  final String announcementPhoto;
  final String date;
  final bool isImportant;

  const Announcement({
    required this.id,
    required this.isImportant,
    required this.announcementBody,
    required this.announcementPhoto,
    required this.announcer,
    required this.announcerPhoto,
    required this.subject,
    required this.date,
  });

  @override
  List<Object?> get props => [
        id,
        isImportant,
        announcerPhoto,
        announcementBody,
        announcer,
        announcementPhoto,
        subject,
        date,
      ];
}
