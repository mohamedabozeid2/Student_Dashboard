import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/hive/hive_helper.dart';
import '../../../../core/hive/hive_keys.dart';
import '../../../../core/network/check_connection.dart';
import '../../../../core/utils/components.dart';
import '../../../../core/utils/constants.dart';
import '../../../data/model/announcement_model.dart';
import '../../../data/model/course_model.dart';
import '../../../data/model/exam_model.dart';
import '../../../domain/use_cases/main_use_cases/get_announcements.dart';
import '../../../domain/use_cases/main_use_cases/get_course.dart';
import '../../../domain/use_cases/main_use_cases/get_exams.dart';
import '../../../domain/use_cases/main_use_cases/publish_course.dart';
import '../../../domain/use_cases/main_use_cases/send_announcements.dart';
import '../../../domain/use_cases/main_use_cases/send_exam.dart';
import '../../screens/login_screen/login_screen.dart';
import '../../screens/no_internet_screen/no_internet_screen.dart';
import 'main_states.dart';

class MainCubit extends Cubit<MainStates> {
  final SendAnnouncementUseCase _sendAnnouncementUseCase;
  final GetAnnouncementsUseCase _getAnnouncementsUseCase;
  final SendExamUseCase _sendExamUseCase;
  final GetExamsUseCase _getExamsUseCase;
  final GetCourseUseCase _getCourseUseCase;
  final PublishCourseUseCase _publishCourseUseCase;

  MainCubit(
    this._sendAnnouncementUseCase,
    this._getAnnouncementsUseCase,
    this._sendExamUseCase,
    this._getExamsUseCase,
    this._getCourseUseCase,
    this._publishCourseUseCase,
  ) : super(MainInitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  void signOut({
    required BuildContext context,
  }) {
    HiveHelper.removeStudent();
    Components.navigateAndFinish(context: context, widget: LoginScreen());
    Constants.setCurrentStudent(null);
    HiveHelper.putInBox(
      box: HiveHelper.loggedIn,
      key: HiveKeys.loggedIn.toString(),
      data: false,
    );
    Constants.setLoggedIn(false);
    emit(MainSignOutState());
  }

  void getAllData({
    required BuildContext context,
  }) {
    emit(MainGetAllDataLoadingState());
    CheckConnection.checkConnection().then((value) {
      Constants.setInternetConnection(value);
      if (value) {
        Future.wait([
          getExams().then((value) {
            Constants.scheduleTasks.addAll(Constants.exams);
          }),
          getAnnouncements().then((value) {
            Constants.scheduleTasks.addAll(Constants.announcements);
          }),
          getCourse().then((value) {
            Constants.scheduleTasks.addAll(Constants.courses);
          })
        ]).then((value) {
          emit(MainGetAllDataSuccessState());
        }).catchError((error) {
          emit(MainGetAllDataErrorState(error.toString()));
        });
      } else {
        debugPrint("NO INTERNET");
        Components.navigateTo(
            context,
            const NoInternetScreen(
              fromLogin: false,
            ));
      }
    });
  }

  Future<void> sendAnnouncement({
    required Map<String, dynamic> announcementModel,
    required BuildContext context,
  }) async {
    emit(MainSendAnnouncementLoadingState());
    CheckConnection.checkConnection().then((value) async {
      Constants.setInternetConnection(value);
      if (value) {
        await _sendAnnouncementUseCase
            .execute(announcement: announcementModel)
            .then((value) {
          value.fold((l) {
            emit(MainSendAnnouncementErrorState(l.message));
          }, (r) {
            emit(MainSendAnnouncementSuccessState());
          });
        });
      } else {
        Components.navigateTo(
            context,
            const NoInternetScreen(
              fromLogin: false,
            ));
      }
    });
  }

  Future<void> getAnnouncements() async {
    // emit(MainGetAnnouncementLoadingState());
    Constants.announcements = [];
    await _getAnnouncementsUseCase.execute().then((value) {
      value.fold((l) {
        emit(MainGetAnnouncementErrorState(l.message));
      }, (r) {
        for (var element in r.docs) {
          Constants.announcements
              .add(AnnouncementModel.fromJson(element.data()));
        }
        Constants.announcements.shuffle();
        // emit(MainGetAnnouncementSuccessState());
      });
    });
  }

  Future<void> sendExam({
    required Map<String, dynamic> examModel,
    required BuildContext context,
  }) async {
    emit(MainSendExamLoadingState());
    CheckConnection.checkConnection().then((value) async {
      Constants.setInternetConnection(value);
      if (value) {
        await _sendExamUseCase.execute(exam: examModel).then((value) {
          value.fold((l) {
            emit(MainSendExamErrorState(l.message));
          }, (r) {
            emit(MainSendExamSuccessState());
          });
        });
      } else {
        Components.navigateTo(
            context,
            const NoInternetScreen(
              fromLogin: false,
            ));
      }
    });
  }

  Future<void> getExams() async {
    // emit(MainGetExamLoadingState());
    Constants.exams = [];
    await _getExamsUseCase.execute().then((value) {
      value.fold((l) {
        emit(MainGetExamErrorState(l.message));
      }, (r) {
        for (var element in r.docs) {
          Constants.exams.add(ExamModel.fromJson(element.data()));
        }
        // emit(MainGetExamSuccessState());
      });
    });
  }

  Future<void> publishCourse({
    required Map<String, dynamic> courseModel,
    required BuildContext context,
  }) async {
    CheckConnection.checkConnection().then((value) async {
      Constants.setInternetConnection(value);
      if (value) {
        await _publishCourseUseCase.execute(course: courseModel).then((value) {
          value.fold((l) {
            emit(MainPublishCourseErrorState(l.message));
          }, (r) {
            emit(MainSendExamSuccessState());
          });
        });
      } else {
        Components.navigateTo(
            context,
            const NoInternetScreen(
              fromLogin: false,
            ));
      }
    });
  }

  Future<void> getCourse() async {
    Constants.courses = [];
    await _getCourseUseCase.execute().then((value) {
      value.fold((l) {
        emit(MainGetCourseErrorState(l.message));
      }, (r) {
        for (var element in r.docs) {
          Constants.courses.add(CourseModel.fromJson(element.data()));
        }
      });
    });
  }
}
