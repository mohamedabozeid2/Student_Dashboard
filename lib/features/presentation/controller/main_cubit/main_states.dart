abstract class MainStates{}

class MainInitialState extends MainStates{}

class MainSignOutState extends MainStates{}

class MainLoadUserLoadingData extends MainStates{}
class MainLoadUserSuccessData extends MainStates{}
class MainLoadUserErrorData extends MainStates{}


class MainSendAnnouncementLoadingState extends MainStates{}
class MainSendAnnouncementSuccessState extends MainStates{}
class MainSendAnnouncementErrorState extends MainStates{
  final String error;

  MainSendAnnouncementErrorState(this.error);
}


class MainGetAnnouncementLoadingState extends MainStates{}
class MainGetAnnouncementSuccessState extends MainStates{}
class MainGetAnnouncementErrorState extends MainStates{
  final String error;

  MainGetAnnouncementErrorState(this.error);
}

class MainSendExamLoadingState extends MainStates{}
class MainSendExamSuccessState extends MainStates{}
class MainSendExamErrorState extends MainStates{
  final String error;

  MainSendExamErrorState(this.error);
}
class MainGetExamLoadingState extends MainStates{}
class MainGetExamSuccessState extends MainStates{}
class MainGetExamErrorState extends MainStates{
  final String error;

  MainGetExamErrorState(this.error);
}

class MainGetCourseLoadingState extends MainStates{}
class MainGetCourseSuccessState extends MainStates{}
class MainGetCourseErrorState extends MainStates{
  final String error;

  MainGetCourseErrorState(this.error);
}

class MainPublishCourseLoadingState extends MainStates{}
class MainPublishCourseSuccessState extends MainStates{}
class MainPublishCourseErrorState extends MainStates{
  final String error;

  MainPublishCourseErrorState(this.error);
}


class MainGetAllDataLoadingState extends MainStates{}
class MainGetAllDataSuccessState extends MainStates{}
class MainGetAllDataErrorState extends MainStates{
  final String error;

  MainGetAllDataErrorState(this.error);
}


class MainStudentImagePickedLoadingState extends MainStates{}
class MainStudentImagePickedSuccessState extends MainStates{}
class MainStudentImagePickedErrorState extends MainStates{
  final String error;

  MainStudentImagePickedErrorState(this.error);

}

class MainUploadStudentImagePickedLoadingState extends MainStates{}
class MainUploadStudentImagePickedSuccessState extends MainStates{}
class MainUploadStudentImagePickedErrorState extends MainStates{
  final String error;

  MainUploadStudentImagePickedErrorState(this.error);

}

class MainUploadStudentDataLoadingState extends MainStates{}
class MainUploadStudentDataSuccessState extends MainStates{}
class MainUploadStudentDataErrorState extends MainStates{
  final String error;

  MainUploadStudentDataErrorState(this.error);
}

class MainGetStudentDataLoadingState extends MainStates{}
class MainGetStudentDataSuccessState extends MainStates{}
class MainGetStudentDataErrorState extends MainStates{
  final String error;

  MainGetStudentDataErrorState(this.error);
}
