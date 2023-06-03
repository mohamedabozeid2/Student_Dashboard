import 'package:final_student_dashboard/features/domain/entities/announcement.dart';

class AnnouncementModel extends Announcement {
  const AnnouncementModel({
    required super.announcementBody,
    required super.announcementPhoto,
    required super.announcer,
    required super.announcerPhoto,
    required super.subject,
    required super.date,
    required super.id,
    required super.isImportant,
  });

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) {
    return AnnouncementModel(
      announcementBody: json['announcementBody'],
      announcementPhoto: json['announcementPhoto'],
      announcer: json['announcer'],
      announcerPhoto: json['announcerPhoto'],
      subject: json['subject'],
      date: json['date'],
      id: json['id'],
      isImportant: json['isImportant'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "announcementBody": announcementBody,
      "announcementPhoto": announcementPhoto,
      "announcer": announcer,
      "announcerPhoto": announcerPhoto,
      "subject": subject,
      "date": date,
      "isImportant": isImportant,
      "id": id,
    };
  }
}
