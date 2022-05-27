abstract class SocialAppStates {}

class SocialAppInitialState extends SocialAppStates {}

class SocialAppGetUserLoadingState extends SocialAppStates {}

class SocialAppGetUserSuccessState extends SocialAppStates
{
}

class SocialAppGetUserErrorState extends SocialAppStates
{
  final String error;

  SocialAppGetUserErrorState(this.error);
}
class SocialChangeBottomNavState extends SocialAppStates{}
class SocialNewPostState extends SocialAppStates{}


class SocialProfileImagePackerSuccessState extends SocialAppStates{}
class SocialProfileImagePackerErrorState extends SocialAppStates{
  final String error;

  SocialProfileImagePackerErrorState(this.error);
}
class SocialUploadProfileImageSuccessState extends SocialAppStates{}
class SocialUploadProfileImageErrorState extends SocialAppStates{
  final String error;

  SocialUploadProfileImageErrorState(this.error);
}

class SocialCoverImagePackerSuccessState extends SocialAppStates{}
class SocialCoverImagePackerErrorState extends SocialAppStates{
  final String error;

  SocialCoverImagePackerErrorState(this.error);
}
class SocialUploadCoverImageSuccessState extends SocialAppStates{}
class SocialUploadCoverImageErrorState extends SocialAppStates{
  final String error;

  SocialUploadCoverImageErrorState(this.error);
}

class SocialAppUserUploadLoadingState extends SocialAppStates {}
class SocialUserUploadErrorState extends SocialAppStates{
  final String error;

  SocialUserUploadErrorState(this.error);
}